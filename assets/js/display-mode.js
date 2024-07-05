// https://whitep4nth3r.com/blog/best-light-dark-mode-theme-toggle-javascript/

const htmlDoc = document.querySelector("html")

/**
* Utility function to calculate the current theme setting.
* Look for a local storage value.
* Fall back to system setting.
* Fall back to light mode.
*/
function calculateSettingAsThemeString({ localStorageTheme, systemSettingDark }) {
    if (localStorageTheme !== null) {
      return localStorageTheme;
    }
  
    if (systemSettingDark.matches) {
      return "dark";
    }
  
    return "light";
  }

  
  /**
  * Utility function to update the theme setting on the html tag
  */
  function updateThemeOnHtmlEl(theme) {
    if (theme === "system") {
      htmlDoc.removeAttribute("data-theme");
      return
    }

    htmlDoc.setAttribute("data-theme", theme);
  }
  
  
  /**
  * On page load:
  */
  
  /**
  * 1. Grab what we need from the DOM and system settings on page load
  */
  const buttons = document.querySelectorAll("[data-theme-toggle]");
  const localStorageTheme = localStorage.getItem("theme");
  const systemSettingDark = window.matchMedia("(prefers-color-scheme: dark)");
  
  /**
  * 2. Work out the current site settings
  */
  let currentThemeSetting = calculateSettingAsThemeString({ localStorageTheme, systemSettingDark });
  
  /**
  * 3. Update the theme setting and button text according to current settings
  */
  updateThemeOnHtmlEl(currentThemeSetting);
  
  console.log({currentThemeSetting})

  /**
  * 4. Add an event listener to toggle the theme
  */
  buttons.forEach(el => {
    if (el.dataset.themeToggle === currentThemeSetting) {
      el.classList.add("active-display-mode")
    }
    
    el.addEventListener("click", (event) => {
      const newTheme = event.currentTarget.dataset.themeToggle;
    
      localStorage.setItem("theme", newTheme);
      buttons.forEach(el => el.classList.remove("active-display-mode"));
      
      updateThemeOnHtmlEl(newTheme);
      el.classList.add("active-display-mode");
    
      currentThemeSetting = newTheme;
    });
  })