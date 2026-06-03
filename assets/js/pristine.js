// Add missing URL regex
URL_REGEX =
  /^(https?:\/\/)?[a-zA-Z0-9@:%._\+~#=\-]{1,256}\.[a-zA-Z0-9\(\)]{1,63}\b(?:[a-zA-Z0-9\(\)@:%_\+.~#?&\/=]*)$/;
Pristine.addValidator(
  "url",
  (val) => !val || URL_REGEX.test(val),
  pristineValidationMessages.url,
  1,
  false
);

// Add the localised messages. Values for pristineValidationMessages are added to the head element
Pristine.addMessages("{{ .Lang }}", pristineValidationMessages);
Pristine.setLocale("{{ .Lang }}");
