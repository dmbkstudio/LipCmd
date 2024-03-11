json_file="./plugins/LipCmd/config/lipcmd.json"

github_proxy=$(grep -Po '"githubProxy":.*?[^\\]",' "$json_file" | sed 's/"githubProxy": "\(.*\)",/\1/')

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-lua.json > ./.lip/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-lua.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-quickjs.json > ././lip/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-quickjs.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2Fbds.json > ././lip/metadata/github.com%2FLiteLDev%2Fbds.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2Fbdsdown.json > ././lip/metadata/github.com%2FLiteLDev%2Fbdsdown.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2Fbdsdown-legacy.json > ././lip/metadata/github.com%2FLiteLDev%2Fbdsdown-legacy.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FCrashLogger.json > ././lip/metadata/github.com%2FLiteLDev%2FCrashLogger.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FLegacyRemoteCall.json > ././lip/metadata/github.com%2FLiteLDev%2FLegacyRemoteCall.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FLegacyScriptEngine.json > ././lip/metadata/github.com%2FLiteLDev%2FLegacyScriptEngine.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FLeviLamina.json > ././lip/metadata/github.com%2FLiteLDev%2FLeviLamina.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2Flevilamina-loc.json > ././lip/metadata/github.com%2FLiteLDev%2Flevilamina-loc.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FPeEditor.json > ././lip/metadata/github.com%2FLiteLDev%2FPeEditor.json

curl -s ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%2FLiteLDev%2FPreLoader.json > ././lip/metadata/github.com%2FLiteLDev%2FPreLoader.json






















