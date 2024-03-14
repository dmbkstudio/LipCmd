json_file="./plugins/Lipcmd/config/lipcmd.json"
github_proxy=$(grep -Po '"githubProxy":.*?[^\\]",' "$json_file" | sed 's/"githubProxy": "\(.*\)",/\1/')

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-lua.json | echo > ./.lip/metadata/gitea.litebds.com%2FLiteLDev%2Flegacy-script-engine-lua.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/gitea.litebds.com%252FLiteLDev%252Flegacy-script-engine-quickjs.json | echo > ./.lip/metadata/gitea.litebds.com%2FLiteLDev%2Flegacy-script-engine-quickjs.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FCrashLogger.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FCrashLogger.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyMoney.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyMoney.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyParticleAPI.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyParticleAPI.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyRemoteCall.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyRemoteCall.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLegacyScriptEngine.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FLegacyScriptEngine.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FLeviLamina.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FLeviLamina.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FPeEditor.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FPeEditor.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252FPreLoader.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2FPreLoader.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Fbds.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2Fbds.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Fbdsdown-legacy.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2Fbdsdown-legacy.json

wget -qO- ${github_proxy}https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/metadata/github.com%252FLiteLDev%252Flevilamina-loc.json | echo > ./.lip/metadata/github.com%2FLiteLDev%2Flevilamina-loc.json
