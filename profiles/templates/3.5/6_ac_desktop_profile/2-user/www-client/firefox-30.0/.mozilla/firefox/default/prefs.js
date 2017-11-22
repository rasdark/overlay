# Calculate# Calculate
#настройки дисковой квоты под кэш
user_pref("browser.cache.disk.capacity", 5000);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);
user_pref("browser.cache.disk.smart_size.use_old_max", false);
user_pref("browser.cache.frecency_experiment", 2);
#настройки сохранялки
user_pref("browser.download.importedFromSqlite", true);
user_pref("browser.download.manager.showAlertOnComplete", false);
user_pref("browser.download.manager.showWhenStarting", false);
user_pref("browser.download.useDownloadDir", false);
#отключить проверку браузера по умолчанию
user_pref("browser.shell.checkDefaultBrowser", false);
#домашняя страница
user_pref("browser.startup.homepage", "http://start.calculate-linux.org");
#?os_locale_language==ru#
user_pref("browser.startup.homepage", "http://start.calculate-linux.ru");
#os_locale_language#
#версия последнего браузера, открывшего текущий профиль (нужно чтобы не отправлял на сайт firefox)
user_pref("browser.startup.homepage_override.mstone", "ignore");
#скрывать панель вкладок когда открыта только одна страница
user_pref("browser.tabs.autoHide", false);
#отключить вопрос при закрытии браузерв
user_pref("browser.tabs.warnOnClose", false);
#кастомизируем вид фф
user_pref("browser.uiCustomization.state", "{\"placements\":{\"PanelUI-contents\":[\"edit-controls\",\"zoom-controls\",\"new-window-button\",\"privatebrowsing-button\",\"save-page-button\",\"print-button\",\"history-panelmenu\",\"fullscreen-button\",\"find-button\",\"preferences-button\",\"add-ons-button\",\"developer-button\"],\"addon-bar\":[\"addonbar-closebutton\",\"status-bar\"],\"PersonalToolbar\":[\"personal-bookmarks\"],\"nav-bar\":[\"urlbar-container\",\"search-container\",\"webrtc-status-button\",\"bookmarks-menu-button\",\"downloads-button\",\"home-button\",\"social-share-button\",\"abp-toolbarbutton\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"toolbar-menubar\":[\"menubar-items\"]},\"seen\":[\"abp-toolbarbutton\"],\"dirtyAreaCache\":[\"PersonalToolbar\",\"nav-bar\",\"TabsToolbar\",\"toolbar-menubar\"],\"newElementCount\":0}");
user_pref("extensions.shownSelectionUI", true);
user_pref("extensions.ui.dictionary.hidden", true);
user_pref("extensions.ui.experiment.hidden", true);
user_pref("extensions.ui.lastCategory", "addons://list/plugin");
user_pref("extensions.ui.locale.hidden", false);
#extensions
#?os_locale_language==ru#
user_pref("extensions.bootstrappedAddons", "{\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"version\":\"2.6.5\",\"type\":\"extension\",\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\"},\"langpack-ru@firefox.mozilla.org\":{\"version\":\"31.2.0\",\"type\":\"locale\",\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-ru@firefox.mozilla.org\"}}");
user_pref("extensions.installCache", "[{\"name\":\"app-global\",\"addons\":{\"langpack-es-ES@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-es-ES@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277588000},\"langpack-ru@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-ru@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277589000},\"{972ce4c6-7e08-4474-a285-3208198ce6fd}\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/{972ce4c6-7e08-4474-a285-3208198ce6fd}\",\"mtime\":1415277601000,\"rdfTime\":1415277564000}}},{\"name\":\"app-profile\",\"addons\":{\"vimperator@mozdev.org\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/vimperator@mozdev.org.xpi\",\"mtime\":1415353552000},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\",\"mtime\":1415353520000}}}]");
#os_locale_language#
#?os_locale_language==es#
user_pref("extensions.bootstrappedAddons", "{\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"version\":\"2.6.5\",\"type\":\"extension\",\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\"},\"langpack-es-ES@firefox.mozilla.org\":{\"version\":\"31.2.0\",\"type\":\"locale\",\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-es-ES@firefox.mozilla.org\"}}");
user_pref("extensions.installCache", "[{\"name\":\"app-global\",\"addons\":{\"langpack-es-ES@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-es-ES@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277588000},\"langpack-ru@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-ru@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277589000},\"{972ce4c6-7e08-4474-a285-3208198ce6fd}\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/{972ce4c6-7e08-4474-a285-3208198ce6fd}\",\"mtime\":1415277601000,\"rdfTime\":1415277564000}}},{\"name\":\"app-profile\",\"addons\":{\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\",\"mtime\":1415608748000},\"vimperator@mozdev.org\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/vimperator@mozdev.org.xpi\",\"mtime\":1415608748000}}}]");
#os_locale_language#
#?in(os_locale_language,ru,es)==#
user_pref("extensions.bootstrappedAddons", "{\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"version\":\"2.6.5\",\"type\":\"extension\",\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\"}}");
user_pref("extensions.installCache", "[{\"name\":\"app-global\",\"addons\":{\"langpack-es-ES@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-es-ES@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277588000},\"langpack-ru@firefox.mozilla.org\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/langpack-ru@firefox.mozilla.org\",\"mtime\":1415277603000,\"rdfTime\":1415277589000},\"{972ce4c6-7e08-4474-a285-3208198ce6fd}\":{\"descriptor\":\"/usr/lib/firefox/browser/extensions/{972ce4c6-7e08-4474-a285-3208198ce6fd}\",\"mtime\":1415277601000,\"rdfTime\":1415277564000}}},{\"name\":\"app-profile\",\"addons\":{\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi\",\"mtime\":1415612895000},\"vimperator@mozdev.org\":{\"descriptor\":\"#-ini(resource.path)-#/.mozilla/firefox/#-case(lower,os_linux_shortname)-#.default/extensions/vimperator@mozdev.org.xpi\",\"mtime\":1415612895000}}}]");
#in#
user_pref("extensions.enabledAddons", "vimperator%40mozdev.org:3.8.2,%7B972ce4c6-7e08-4474-a285-3208198ce6fd%7D:31.2.0");
#adblock
user_pref("extensions.adblockplus.currentVersion", "2.6.5");
user_pref("extensions.adblockplus.notificationdata", "{\"shown\":[],\"lastCheck\":1415355273524,\"softExpiration\":1415424686041,\"hardExpiration\":1415528074211,\"data\":{\"notifications\":[],\"version\":\"201411071010\"},\"lastError\":0,\"downloadStatus\":\"synchronize_ok\"}");
user_pref("extensions.adblockplus.showinstatusbar", true);
user_pref("extensions.adblockplus.showintoolbar", false);
#vimperator
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("extensions.liberator.privacy.cpd.commandLine", false);
user_pref("extensions.liberator.privacy.cpd.macros", false);
user_pref("extensions.liberator.privacy.cpd.marks", false);
user_pref("extensions.liberator.saved.accessibility.typeaheadfind", false);
user_pref("extensions.liberator.saved.accessibility.typeaheadfind.autostart", false);
user_pref("extensions.liberator.saved.accessibility.typeaheadfind.enablesound", false);
user_pref("extensions.liberator.saved.browser.link.open_newwindow", 3);
user_pref("extensions.liberator.saved.browser.link.open_newwindow.restriction", 0);
user_pref("extensions.vimperator.firsttime", false);
#установить google как поисковик по умолчанию
#?os_locale_language==ru#
user_pref("keyword.URL", "http://www.google.ru/search?q=");
#os_locale_language#
#?os_locale_language!=ru#
user_pref("keyword.URL", "http://www.google.com/search?q=");
#os_locale_language#
#отключаем запрос отслеживания
user_pref("privacy.donottrackheader.enabled", true);
#отключаем помощь mozilla
user_pref("toolkit.telemetry.prompted", 2);
user_pref("toolkit.telemetry.rejected", true);
user_pref("toolkit.telemetry.enabled", false);
