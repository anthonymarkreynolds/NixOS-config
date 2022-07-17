local dap = require('dap')
dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {'/home/anthony/.vscode/extensions/firefox-devtools.vscode-firefox-debug-2.9.7/dist/adapter.bundle.js'},
}

dap.configurations.javascript = {
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/run/current_system/sw/bin/firefox'
}
