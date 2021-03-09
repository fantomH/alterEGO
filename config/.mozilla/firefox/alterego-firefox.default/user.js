/*-{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# user.js:
#   created:       '2021-02-23 02:54:43 UTC'
#   updated:       '2021-03-04 22:24:16 UTC'
#   description:   'Firefox configuration.' 
#
#------------------------------{ alterEGO Linux }----------------------------*/

user_pref("browser.startup.page", 1);
user_pref("browser.startup.homepage", "https://fantomh.xyz");

/*-[ CLEAR BROWSING ]                                                        */
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.ClearOnShutdown.cookies", true);
user_pref("privacy.ClearOnShutdown.cache", true);
user_pref("privacy.ClearOnShutdown.downloads", true);
user_pref("privacy.ClearOnShutdown.history", true);
user_pref("privacy.ClearOnShutdown.formData", true);
user_pref("privacy.ClearOnShutdown.offlineApps", true);
user_pref("privacy.ClearOnShutdown.sessions", true);
user_pref("privacy.ClearOnShutdown.siteSettings", true);

/*-[ TELEMETRY ]                                                             */
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.pioneer-new-studies-available", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);

/*-[ OTHER CONFIG ]                                                           */
/* --- Fix mouse strange behavior with context menu                           */
user_pref("ui.context_menus.after_mouseup", true);


/*-{ file:fin }--------------------------------------------------------------*/
