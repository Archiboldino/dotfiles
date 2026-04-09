return {
  -- Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = false,
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                  reportUnknownParameterType = false,
                  reportUnknownArgumentType = false,
                  reportUnknownLambdaType = false,
                  reportUnknownVariableType = false,
                  reportUnknownMemberType = false,
                },
              },
            },
          },
        },
      },
    },
  },

  -- TS
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "thenbe/neotest-playwright" },
    opts = {
      adapters = {
        ["neotest-playwright"] = {
          options = {
            persist_project_selection = true,
            -- enable_dynamic_test_discovery = true,
            is_test_file = function(file_path)
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
          jestConfigFile = "./jest.config.js",
          -- jest_test_discovery = true,
          isTestFile = function(file_path)
            local extension = file_path:find("%.test%.[tj]sx?$") ~= nil or file_path:find("%.spec%.[tj]sx?$") ~= nil
            local unit_path = file_path:find("unit/") ~= nil
            if extension and unit_path then
              return true
            end
            local file_content = io.open(file_path):read("*a")
            return file_content:find("it") ~= nil or file_content:find("jest") ~= nil
          end,
        },
      },
    },
  },

  -- Rust
  -- {
  --   "mrcjkb/rustaceanvim",
  --   opts = {
  --     server = {
  --       default_settings = {
  --         -- rust-analyzer language server configuration
  --         ["rust-analyzer"] = {
  --           cargo = {
  --             -- allFeatures = false, -- important
  --             -- extraArgs = { "--release" }, -- probably not required, but better since used for building
  --             allTargets = false, -- Not required
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- YAML
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!Equals sequence",
                "!FindInMap sequence",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!Join sequence",
                "!Ref",
                "!Select sequence",
                "!Split sequence",
                "!Sub",
              },
            },
          },
        },
      },
    },
  },
}
