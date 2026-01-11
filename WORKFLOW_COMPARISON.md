# Workflow Comparison: Kiro CLI vs OpenCode

This document compares the Ralph Wiggum workflow implementation between Kiro CLI (original) and OpenCode (this adaptation).

## Architecture Comparison

### Agent Configuration

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Location** | `.kiro/agents/` | `.opencode/agent/` |
| **Format** | YAML (`.yaml`) | Markdown with frontmatter (`.md`) |
| **Configuration Style** | Structured YAML with `tools` list | Markdown frontmatter with YAML |
| **Prompt Location** | `instructions:` field in YAML | Markdown body after frontmatter |

**Kiro CLI Example:**
```yaml
name: ralph-clarify
description: Requirements discovery agent
tools:
  - file_operations
  - read_file
  - write_file
settings:
  temperature: 0.7
```

**OpenCode Example:**
```markdown
---
description: Requirements discovery agent
mode: primary
temperature: 0.7
tools:
  write: true
  edit: true
---

[Prompt instructions in markdown...]
```

### Agent Invocation

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Primary Method** | `kiro-cli chat --agent ralph-clarify` | Tab key or `@ralph-clarify` |
| **Agent Switching** | Separate command invocations | In-session switching with Tab |
| **Execution Mode** | `--mode script` for non-interactive | Always interactive |

### Execution Model

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Loop Style** | Bash loop with pipe | Interactive sessions |
| **Automation** | Fully automated with bash | Semi-automated (user-guided) |
| **Completion Detection** | Grep for "DONE" in output | Manual monitoring or agent output |
| **State Persistence** | Files + Git | Files + Git |

**Kiro CLI Execution:**
```bash
while :; do 
  cat PROMPT.md | kiro-cli chat --mode script
done
```

**OpenCode Execution:**
```
1. Start opencode
2. Switch to build agent (Tab)
3. Reference PROMPT.md
4. Agent works through TODO.md
5. Review and continue
```

## Workflow Phases Comparison

### Phase 1: Clarify

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Invocation** | `kiro-cli chat --agent ralph-clarify` | `@ralph-clarify` or Tab |
| **Interaction** | Interactive Q&A | Interactive Q&A |
| **Output** | clarify-session.md | clarify-session.md |
| **Question Count** | 40-70 questions | 40-70 questions |

Both implementations are functionally identical in this phase.

### Phase 2: Plan

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Invocation** | `kiro-cli chat --agent ralph-plan` | `@ralph-plan` or Tab |
| **Input** | clarify-session.md | clarify-session.md |
| **Output** | PROMPT.md + TODO.md | PROMPT.md + TODO.md |
| **Review** | Manual file review | Manual file review |

Both implementations are functionally identical in this phase.

### Phase 3: Execute

| Aspect | Kiro CLI | OpenCode |
|--------|----------|----------|
| **Execution** | Automated bash loop | Interactive sessions |
| **Control** | Max iterations in bash | Manual session management |
| **Feedback Loop** | Automatic with grep | Manual review |
| **Task Picking** | Agent autonomous | Agent autonomous with guidance |
| **Stopping** | Grep "DONE" or max iterations | User determines completion |

This is where the implementations differ most significantly.

## Key Differences

### 1. Automation Level

**Kiro CLI:**
- Fully automated execution loop
- Runs until completion or max iterations
- Minimal human intervention

**OpenCode:**
- Semi-automated with human guidance
- Interactive sessions
- More control but requires monitoring

### 2. Agent Experience

**Kiro CLI:**
- CLI-first experience
- Script mode for automation
- Agent invoked via command line

**OpenCode:**
- TUI-first experience
- Always interactive
- Agent switching within session

### 3. Execution Philosophy

**Kiro CLI:**
- "Set it and forget it" automation
- Loop until done
- Machine-driven

**OpenCode:**
- Guided autonomous work
- Review and approve
- Human-in-the-loop

## Advantages & Trade-offs

### Kiro CLI Approach

**Advantages:**
- Fully automated execution
- Can run unattended
- Clear completion criteria (grep for DONE)
- Easy to set max iterations

**Trade-offs:**
- Less control during execution
- Harder to intervene mid-process
- Requires bash loop setup
- May waste iterations on wrong path

### OpenCode Approach

**Advantages:**
- More control during execution
- Easy to review and adjust
- Better for learning and exploration
- Natural TUI experience
- Can intervene anytime

**Trade-offs:**
- Requires manual monitoring
- Less automation
- Must guide the agent
- Completion less automated

## When to Use Each

### Use Kiro CLI (Original) When:
- You want full automation
- You trust the process completely
- You have well-tuned prompts
- You want unattended execution
- You're comfortable with bash loops

### Use OpenCode (This Adaptation) When:
- You want more control
- You prefer interactive development
- You want to learn from the process
- You like the TUI experience
- You want to review each step
- You're adapting the workflow

## Migration Guide

### From Kiro CLI to OpenCode

1. **Copy agent configurations:**
   ```bash
   # Convert YAML to markdown
   # Move from .kiro/agents/*.yaml to .opencode/agent/*.md
   ```

2. **Adjust expectations:**
   - Less automation, more control
   - No bash loop needed
   - Use Tab to switch agents

3. **Adapt workflow:**
   - Start opencode instead of bash loop
   - Guide the build agent through tasks
   - Review progress regularly

### From OpenCode to Kiro CLI

1. **Convert agent configurations:**
   ```bash
   # Convert markdown to YAML
   # Move from .opencode/agent/*.md to .kiro/agents/*.yaml
   ```

2. **Set up bash loop:**
   ```bash
   while :; do cat PROMPT.md | kiro-cli chat --mode script; done
   ```

3. **Adjust expectations:**
   - More automation, less control
   - Trust the loop
   - Set max iterations

## Hybrid Approach

You can combine both approaches:

1. **Use OpenCode for clarify and plan phases:**
   - Better interactive experience
   - Easier to review and adjust

2. **Export for Kiro CLI execution:**
   - Copy PROMPT.md and TODO.md
   - Run automated loop with Kiro CLI
   - Get automation benefits

3. **Return to OpenCode for refinement:**
   - Review results
   - Adjust prompts
   - Continue interactively

## Conclusion

Both implementations achieve the same goal: autonomous development with the Ralph Wiggum technique. The choice between them depends on:

- **Automation needs**: Kiro CLI for full automation, OpenCode for guided work
- **Control preference**: Kiro CLI for hands-off, OpenCode for hands-on
- **Tool ecosystem**: Use what fits your existing tools
- **Learning style**: OpenCode better for understanding, Kiro CLI for production

The OpenCode adaptation maintains the core Ralph Wiggum philosophy while embracing OpenCode's interactive, TUI-first approach.
