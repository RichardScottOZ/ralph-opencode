# Quick Start Guide

This guide will help you get started with the Ralph Wiggum workflow for OpenCode in under 10 minutes.

## Prerequisites

- OpenCode installed ([installation guide](https://opencode.ai/docs))
- Git installed
- A project idea or requirement

## Step 1: Setup (2 minutes)

Clone this repository and set up your project:

```bash
# Clone ralph-opencode
git clone https://github.com/RichardScottOZ/ralph-opencode.git
cd ralph-opencode

# Set up your new project
./setup-ralph.sh my-project
cd my-project
```

Your project now has:
- `.opencode/agent/` - Custom Ralph agents
- `PROMPT.md` - Execution instructions template
- `TODO.md` - Task checklist template
- `clarify-session.md` - Requirements template

## Step 2: Clarify (3-5 minutes)

Gather comprehensive requirements:

```bash
# Start OpenCode
opencode

# In OpenCode session:
# Press Tab or type: @ralph-clarify

# Then describe your project:
"I want to build a REST API for managing books in a library"

# Answer the agent's questions (40-70 questions)
# The agent will save everything to clarify-session.md
```

**Tips:**
- Be thorough in your answers
- Think about edge cases
- Consider your constraints
- Don't skip questions - they prevent problems later

## Step 3: Plan (1-2 minutes)

Convert requirements to execution plan:

```bash
# In your OpenCode session:
# Press Tab or type: @ralph-plan

# Tell the agent:
"Read clarify-session.md and create PROMPT.md and TODO.md"

# The agent will generate:
# - PROMPT.md with execution instructions
# - TODO.md with prioritized tasks
```

**Review the generated files** to ensure they match your expectations.

## Step 4: Execute (ongoing)

Build your project iteratively:

```bash
# In your OpenCode session:
# Press Tab to switch to the build agent (default)

# Ask the build agent:
"Read PROMPT.md and start working through TODO.md"

# The agent will:
# 1. Read the first incomplete task
# 2. Implement it
# 3. Test it
# 4. Mark it complete
# 5. Commit changes
# 6. Move to next task
```

**Monitor progress:**
- Check `TODO.md` to see completed tasks
- Review `git log` to see commits
- Verify functionality as features are completed

## Common Workflows

### Starting Fresh

```bash
./setup-ralph.sh project-name
cd project-name
opencode
# Switch to @ralph-clarify
```

### Resume Existing Project

```bash
cd project-name
opencode
# Switch to build agent (Tab)
# Reference PROMPT.md in your message
```

### Adjust Plan Mid-Project

```bash
# In OpenCode session:
# Edit TODO.md manually or ask the agent to adjust it
# Continue with updated plan
```

## Tips for Success

1. **Be thorough in clarification** - 40-70 questions prevent later problems
2. **Add guardrails to PROMPT.md** - Prevent repeated mistakes
3. **Use HARD STOPs** - Review progress at natural breakpoints
4. **Commit frequently** - Every task should result in a commit
5. **Reference PROMPT.md** - Keep the agent focused on instructions
6. **Update TODO.md** - Track progress accurately

## Troubleshooting

### Agent won't switch
- Ensure `.opencode/agent/*.md` files exist
- Restart OpenCode
- Try @mentioning: `@ralph-clarify`

### Agent not following PROMPT.md
- Reference it explicitly: "Read PROMPT.md and follow instructions"
- Add more specific guardrails
- Break down complex tasks

### Tasks not being completed
- Remind agent to update TODO.md
- Add this to PROMPT.md guardrails
- Verify manually and adjust

## Next Steps

- Read the full [README.md](README.md) for detailed documentation
- Check [examples/](examples/) for sample sessions
- Customize agents in `.opencode/agent/` for your workflow
- Join the OpenCode community for support

## Example Session

```
User: I want to build a simple calculator CLI

@ralph-clarify
...answers 50 questions about requirements...

@ralph-plan
"Generate PROMPT.md and TODO.md from clarify-session.md"

[Switch to build agent with Tab]
"Read PROMPT.md and implement the first task from TODO.md"

[Agent implements, tests, commits]

"Continue to next task"

[Repeat until done]
```

That's it! You're now using the Ralph Wiggum workflow with OpenCode.

---

**Questions?** Check the [README.md](README.md) or visit [OpenCode Docs](https://opencode.ai/docs)
