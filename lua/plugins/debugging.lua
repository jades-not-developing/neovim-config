return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		{
            "julianolf/nvim-dap-lldb",
            opts = { codelldb_path = "C:\\Program Files\\LLVM\\bin\\lldb.exe" },
        }
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
        local daplldb = require("dap-lldb")
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

        dapui.setup()
        daplldb.setup()

	--dap.adapters.cppdbg = {
	--	id = "cppdbg",
	--	type = "executable",
	--	command = "C:\\Users\\jeremyirvine\\.vscode\\extensions\\ms-vscode.cpptools-1.22.11-win32-x64\\debugAdapters\\bin\\OpenDebugAD7.exe",
	--	options = {
	--		detached = false,
	--	},
	--}

	--dap.configurations.cpp = {
	--	{
	--		name = "Launch Premake Project",
	--		type = "cppdbg",
	--		request = "launch",
	--		program = function()
    --            return vim.fn.getcwd() .. "/" .. "build" .. "/" .. "bin" .. "/" .. "Debug" .. "/" .. vim.fn.input("Executable name: ", "", "file")
	--		end,
	--		cwd = "${workspaceFolder}",
	--		stopAtEntry = true,
	--	},
	--	{
	--		name = "Launch file",
	--		type = "cppdbg",
	--		request = "launch",
	--		program = function()
	--			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	--		end,
	--		cwd = "${workspaceFolder}",
	--		stopAtEntry = true,
	--	},
	--	{
	--		name = "Attach to gdbserver :1234",
	--		type = "cppdbg",
	--		request = "launch",
	--		MIMode = "gdb",
	--		miDebuggerServerAddress = "localhost:1234",
	--		miDebuggerPath = "C:\\msys64\\mingw64\\bin\\gdb.exe",
	--		cwd = "${workspaceFolder}",
	--		program = function()
	--			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	--		end,
	--	},
	--}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
