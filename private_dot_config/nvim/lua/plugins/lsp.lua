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
    dependencies = { "haydenmeade/neotest-jest", "thenbe/neotest-playwright" },
    opts = {
      adapters = {
        ["neotest-playwright"] = {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
            is_test_file = function(file_path)
              local extension = file_path:find("%.test%.[tj]sx?$") ~= nil or file_path:find("%.spec%.[tj]sx?$") ~= nil
              local path = file_path:find("automation/") ~= nil
              return extension and path
            end,
          },
        },
        ["neotest-jest"] = {
          jestConfigFile = "./jest.config.js",
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
