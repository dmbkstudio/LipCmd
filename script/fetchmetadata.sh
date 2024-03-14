export json_file="./plugins/Lipcmd/config/lipcmd.json"
export github_proxy=$(grep -Po '"githubProxy":.*?[^\\]",' "$json_file" | sed 's/"githubProxy": "\(.*\)",/\1/')

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-lua.json > ./.lip/metadata/gitea.litebds.com%2FLiteLDev%2Flegacy-script-engine-lua.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-quickjs.json > ./.lip/metadata/gitea.litebds.com%2FLiteLDev%2Flegacy-script-engine-quickjs.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FCrashLogger.json > ./.lip/metadata/github.com%2FLiteLDev%2FCrashLogger.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyMoney.json > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyMoney.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyParticleAPI.json > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyParticleAPI.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyRemoteCall.json > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyRemoteCall.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyScriptEngine.json > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyScriptEngine.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLeviLamina.json > ./.lip/metadata/github.com%2FLiteLDev%2FLeviLamina.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FPeEditor.json > ./.lip/metadata/github.com%2FLiteLDev%2FPeEditor.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FPreLoader.json > ./.lip/metadata/github.com%2FLiteLDev%2FPreLoader.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Fbds.json > ./.lip/metadata/github.com%2FLiteLDev%2Fbds.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Fbdsdown-legacy.json > ./.lip/metadata/github.com%2FLiteLDev%2Fbdsdown-legacy.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Flevilamina-loc.json > ./.lip/metadata/github.com%2FLiteLDev%2Flevilamina-loc.json
