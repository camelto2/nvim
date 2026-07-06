-- lazy.nvim
return {
    "robitx/gp.nvim",
    config = function()
        local conf = {
            -- For customization, refer to Install > Configuration in the Documentation/Readme
        	providers = {
    		    openai = {
    		    	endpoint = os.getenv("OPENAI_BASE_URL").."/chat/completions",
    		    	secret = os.getenv("OPENAI_API_KEY"),
    		    },
    		    copilot   = {},
    		    pplx      = {},
    		    ollama    = {},
    		    googleai  = {},
    		    anthropic = {},
          },
          agents = {
            { name    = "ChatGPT-o3-mini",
              disable = true,
            },
            { name    = "ChatGPT4o",
              disable = true,
            },
            { name    = "ChatGPT4o-mini",
              disable = true,
            },
          	{
          		name = "shirty",
          		provider = "openai",
          		chat = true,
          		command = true,
          		model = { model = "google/gemma-4-31B-it" },
              system_prompt = "You are a general AI assistant. The user provided the additional info about how they would like you to respond:\n"
.."- If you're unsure don't guess and say you don't know instead.\n"
.."- Ask question if you need clarification to provide better answer.\n"
.."- Think deeply and carefully from first principles step by step.\n"
.."- Zoom out first to see the big picture and then zoom in to details.\n"
.."- Use Socratic method to improve your thinking and coding skills.\n"
.."- Don't elide any code from your output if the answer requires coding.\n"
.."- Take a deep breath; You've got this!"
          	},
          },
        }
        require("gp").setup(conf)
        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}
