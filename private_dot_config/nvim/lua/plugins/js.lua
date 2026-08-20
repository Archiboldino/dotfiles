return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "thenbe/neotest-playwright" },
    opts = {
      adapters = {
        ["neotest-playwright"] = {
          options = {
            -- persist_project_selection = true,
            enable_dynamic_test_discovery = true,
            is_test_file = function(file_path)
              if !file_path then
                return false
              end

              local extension = file_path:find("%.test%.[tj]sx?$") ~= nil or file_path:find("%.spec%.[tj]sx?$") ~= nil
              local no_unit = file_path:find("unit/") == nil
              local automation_path = file_path:find("automation/") ~= nil
              return extension
                and no_unit
                and (automation_path or io.open(file_path):read("*a"):find("playwright") ~= nil)
            end,
          },
        },
        ["neotest-jest"] = {
          -- jestConfigFile = "./jest.config.js",
          jest_test_discovery = true,
          isTestFile = function(file_path)
            local default = require("neotest-jest.jest-util").defaultIsTestFile(file_path)
            local unit = file_path:find("unit/") ~= nil
            return default and unit
          end,
        },
      },
    },
  },
}
