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
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
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
