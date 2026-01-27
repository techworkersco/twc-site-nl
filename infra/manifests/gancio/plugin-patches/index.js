"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// Require the necessary discord.js classes
const discord_js_1 = require("discord.js");
const Turndown = require("turndown");
const turndown = new Turndown();
const plugin = {
    configuration: {
        name: "Discord bridge",
        author: "freefall",
        url: "https://git.gay/QueerResourcesRiga/gancio-plugin-discord",
        description: "Discord bridge for Gancio",
        settings: {
            token: {
                type: "TEXT",
                description: "Bot token",
                required: true,
                hint: "Bot token",
            },
            guildId: {
                type: "TEXT",
                description: "Guild ID",
                required: true,
                hint: "Guild ID",
            },
            tags: {
                type: "TEXT",
                description: "Tags to sync (comma-separated) - blank for all",
                hint: "tag1,tag2",
            },
        },
    },
    gancio: null,
    settings: null,
    client: new discord_js_1.Client({
        intents: [discord_js_1.GatewayIntentBits.Guilds, discord_js_1.GatewayIntentBits.GuildScheduledEvents],
    }),
    tags: null,
    load(gancio, settings) {
        console.info("Discord bridge loaded!");
        plugin.gancio = gancio;
        plugin.settings = settings;
        if (settings.tags != undefined) {
            plugin.tags = new Set(settings.tags.split(","));
        }
        else {
            plugin.tags = new Set();
        }
        if (!plugin.test()) {
            return;
        }
        // Log in to Discord with your client's token
        plugin.client.login(settings.token);
        // When the client is ready, run this code (only once).
        plugin.client.once(discord_js_1.Events.ClientReady, (readyClient) => {
            console.info(`Discord bridge logged in as ${readyClient.user.tag}`);
        });
    },
    unload() {
        plugin.client = null;
    },
    onTest() {
        plugin.test();
    },
    test() {
        if (!plugin.settings.token) {
            console.error("Token not set!");
            return false;
        }
        if (!plugin.settings.guildId) {
            console.error("Guild ID not set!");
            return false;
        }
        console.log("Everything Ok, presumably!");
        return true;
    },
    onEventCreate(event) {
        if (!event.is_visible) {
            return; // only add visible events
        }
        createDiscordEvent(event);
    },
    onEventUpdate(event) {
        updateDiscordEvent(event);
    },
    onEventDelete(event) {
        deleteDiscordEvent(event);
    },
};
async function createDiscordEvent(event) {
    const guild = await plugin.client.guilds.fetch(plugin.settings.guildId);
    // check if tags match
    const eventTags = new Set(event.tags.map((e) => e.tag));
    const intersection = [...plugin.tags].filter((e) => eventTags.has(e));
    if (intersection.length == 0 && plugin.tags.length != 0) {
        console.info("Not sending event to Discord - tags have no overlap.");
        return;
    }
    console.info("Creating event on Discord.");
    await guild.scheduledEvents.create(discordEventObject(event));
}
async function updateDiscordEvent(event) {
    const dEvent = await findDiscordEvent(event); // find event
    if (dEvent) {
        await dEvent.edit(discordEventObject(event)); // update it
    }
    else {
        // not found?
        await createDiscordEvent(event); // create new one
    }
}
async function deleteDiscordEvent(event) {
    const dEvent = await findDiscordEvent(event);
    await dEvent.setStatus(discord_js_1.GuildScheduledEventStatus.Canceled);
}
function discordEventObject(event) {
    return {
        name: event.title,
        scheduledStartTime: new Date(event.start_datetime * 1000),
        scheduledEndTime: new Date(event.end_datetime * 1000),
        privacyLevel: discord_js_1.GuildScheduledEventPrivacyLevel.GuildOnly,
        entityType: discord_js_1.GuildScheduledEventEntityType.External,
        entityMetadata: {
            location: eventLink(event),
        },
        description: formatText(event.description),
        image: eventImage(event),
    };
}
function formatText(text) {
    return turndown.turndown(text);
}
function eventImage(event) {
    if (event.media.length == 0)
        return null;
    const image = event.media[0];
    const imageLink = `${plugin.gancio.settings.baseurl}/media/${image.url}`;
    return imageLink;
}
async function findDiscordEvent(event) {
    const guild = await plugin.client.guilds.fetch(plugin.settings.guildId);
    const dEvents = await guild.scheduledEvents.fetch();
    const dEvent = dEvents.find((e) => e.entityMetadata.location === eventLink(event));
    return dEvent;
}
function eventLink(event) {
    return `${plugin.gancio.settings.baseurl}/event/${event.slug}`;
}
module.exports = plugin;
//# sourceMappingURL=index.js.map
