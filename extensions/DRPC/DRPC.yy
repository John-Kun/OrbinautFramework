{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "1.3.0",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2020-11-11T15:13:31.2571444+05:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"filename":"NekoPresence.gml","origname":"","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"np_get_avatar_url","kind":2,"help":"np_get_avatar_url(user_id,avatar_hash)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_get_avatar_url","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":192,"order":[
        {"name":"np_get_avatar_url","path":"extensions/DRPC/DRPC.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"NekoPresence.dll","origname":"","init":"__np_initdll","final":"__np_shutdown","kind":1,"uncompress":false,"functions":[
        {"externalName":"np_initdll","kind":1,"help":"__np_initdll()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"__np_initdll","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_shutdown","kind":1,"help":"__np_shutdown()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"__np_shutdown","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_initdiscord","kind":1,"help":"np_initdiscord(client_id,autoRegister,steam_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            1,
          ],"resourceVersion":"1.0","name":"np_initdiscord","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence","kind":1,"help":"np_setpresence(state,details,large_image_key,small_image_key)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_setpresence","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_update","kind":1,"help":"np_update()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"np_update","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"RegisterCallbacks","kind":1,"help":"__np_registercallbacks_do_not_call(arg1,arg2,arg3,arg4)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"resourceVersion":"1.0","name":"__np_registercallbacks_do_not_call","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence_more","kind":1,"help":"np_setpresence_more(small_image_text,large_image_text,instance)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            2,
          ],"resourceVersion":"1.0","name":"np_setpresence_more","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_clearpresence","kind":1,"help":"np_clearpresence()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"np_clearpresence","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_registergame","kind":1,"help":"np_registergame(client_id,command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_registergame","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_registergame_steam","kind":1,"help":"np_registergame_steam(client_id,steam_app_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_registergame_steam","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence_secrets","kind":1,"help":"np_setpresence_secrets(matchSecret,spectateSecret,joinSecret)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_setpresence_secrets","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence_partyparams","kind":1,"help":"np_setpresence_partyparams(partySize,partyMax,partyId,partyPrivacy)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
            1,
            2,
          ],"resourceVersion":"1.0","name":"np_setpresence_partyparams","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_respond","kind":1,"help":"np_respond(user_id,reply)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"np_respond","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence_timestamps","kind":1,"help":"np_setpresence_timestamps(startTimestamp,endTimestamp,is_unix)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"np_setpresence_timestamps","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"np_setpresence_buttons","kind":1,"help":"np_setpresence_buttons(btnId,btnName,btnUrl)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
            1,
          ],"resourceVersion":"1.0","name":"np_setpresence_buttons","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"string(steam_get_app_id())","hidden":false,"resourceVersion":"1.0","name":"np_steam_app_id","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"\"0\"","hidden":false,"resourceVersion":"1.0","name":"np_steam_app_id_empty","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"DISCORD_REPLY_NO","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"DISCORD_REPLY_YES","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"DISCORD_REPLY_IGNORE","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"DISCORD_PARTY_PRIVACY_PRIVATE","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"DISCORD_PARTY_PRIVACY_PUBLIC","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"DISCORD_MAX_BUTTONS","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[
        {"TargetMask":7,"resourceVersion":"1.0","name":"libnekopresence.so","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":6,"resourceVersion":"1.0","name":"NekoPresence_x64.dll","tags":[],"resourceType":"GMProxyFile",},
      ],"copyToTargets":192,"order":[
        {"name":"__np_initdll","path":"extensions/DRPC/DRPC.yy",},
        {"name":"__np_shutdown","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_initdiscord","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_update","path":"extensions/DRPC/DRPC.yy",},
        {"name":"__np_registercallbacks_do_not_call","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence_more","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_clearpresence","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_registergame","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_registergame_steam","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence_secrets","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence_partyparams","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_respond","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence_timestamps","path":"extensions/DRPC/DRPC.yy",},
        {"name":"np_setpresence_buttons","path":"extensions/DRPC/DRPC.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": null,
  "tvosplistinject": null,
  "androidinject": null,
  "androidmanifestinject": null,
  "androidactivityinject": null,
  "gradleinject": null,
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 192,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Plugins",
    "path": "folders/Plugins.yy",
  },
  "resourceVersion": "1.2",
  "name": "DRPC",
  "tags": [],
  "resourceType": "GMExtension",
}