#!/bin/bash

# Ralph Wiggum Setup Script for OpenCode
# This script sets up a new project with the Ralph Wiggum workflow

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for help flag
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Ralph Wiggum Setup Script for OpenCode"
    echo ""
    echo "Usage: ./setup-ralph.sh <project-name>"
    echo ""
    echo "This script sets up a new project with the Ralph Wiggum workflow for OpenCode."
    echo ""
    echo "Example:"
    echo "  ./setup-ralph.sh my-awesome-project"
    echo ""
    echo "The script will:"
    echo "  - Create a new directory for your project"
    echo "  - Initialize a git repository"
    echo "  - Copy OpenCode agent configurations"
    echo "  - Copy template files (PROMPT.md, TODO.md, clarify-session.md)"
    echo "  - Create a project README"
    echo "  - Make an initial git commit"
    exit 0
fi

# Check if project name is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Project name required${NC}"
    echo "Usage: ./setup-ralph.sh <project-name>"
    echo "Use --help for more information"
    exit 1
fi

PROJECT_NAME="$1"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}🤖 Setting up Ralph Wiggum workflow for: ${GREEN}$PROJECT_NAME${NC}"
echo ""

# Create project directory
if [ -d "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Directory '$PROJECT_NAME' already exists${NC}"
    exit 1
fi

echo -e "${YELLOW}Creating project directory...${NC}"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git
echo -e "${YELLOW}Initializing git repository...${NC}"
git init

# Create directory structure
echo -e "${YELLOW}Creating directory structure...${NC}"
mkdir -p .opencode/agent
mkdir -p src

# Copy agent configurations
echo -e "${YELLOW}Copying OpenCode agent configurations...${NC}"
if [ -d "$SCRIPT_DIR/.opencode/agent" ]; then
    cp -r "$SCRIPT_DIR/.opencode/agent/"* .opencode/agent/
else
    echo -e "${RED}Warning: Agent configurations not found at $SCRIPT_DIR/.opencode/agent${NC}"
    echo -e "${YELLOW}You may need to copy them manually.${NC}"
fi

# Copy template files
echo -e "${YELLOW}Copying template files...${NC}"
if [ -d "$SCRIPT_DIR/templates" ]; then
    cp "$SCRIPT_DIR/templates/PROMPT.md" .
    cp "$SCRIPT_DIR/templates/TODO.md" .
    cp "$SCRIPT_DIR/templates/clarify-session.md" .
else
    echo -e "${RED}Warning: Templates not found at $SCRIPT_DIR/templates${NC}"
    echo -e "${YELLOW}Creating basic templates...${NC}"
    
    # Create basic PROMPT.md
    cat > PROMPT.md << 'EOF'
# PROMPT.md

## Project
[Describe your project]

## Instructions

1. Read TODO.md for current tasks
2. Pick the highest priority incomplete task
3. Implement it completely
4. Mark it done in TODO.md
5. Commit your changes
6. Continue to next task

When all tasks are complete, output: DONE
EOF

    # Create basic TODO.md
    cat > TODO.md << 'EOF'
# TODO

## Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

---
## Completed
EOF

    # Create basic clarify-session.md
    cat > clarify-session.md << 'EOF'
# Discovery Session

## Requirements
- [Add your requirements here]

## Notes
- [Add notes from clarification]
EOF
fi

# Create a basic README
echo -e "${YELLOW}Creating project README...${NC}"
cat > README.md << EOF
# $PROJECT_NAME

This project uses the Ralph Wiggum workflow for autonomous AI development with OpenCode.

## Setup

This project was initialized with the Ralph Wiggum workflow for OpenCode.

## Workflow

### Phase 1: Clarify
Gather requirements through comprehensive questioning:

\`\`\`bash
# Switch to the ralph-clarify agent in OpenCode
# Use Tab key to cycle to ralph-clarify, or @mention it
opencode
# In the session, type: @ralph-clarify
# Or press Tab to switch to the agent
\`\`\`

### Phase 2: Plan
Convert requirements into execution files:

\`\`\`bash
# After completing clarification, switch to ralph-plan agent
# In OpenCode session, press Tab or @mention ralph-plan
# @ralph-plan
\`\`\`

### Phase 3: Execute
Work through the tasks with the build agent:

\`\`\`bash
# Switch to the build agent (default agent)
# The build agent will follow PROMPT.md instructions
# Work through TODO.md systematically
# Press Tab to switch back to build agent if needed
\`\`\`

The build agent will:
- Read TODO.md and pick the next task
- Implement the task
- Mark it complete
- Commit changes
- Continue to the next task

## Files

- \`PROMPT.md\` - Instructions for the execution phase
- \`TODO.md\` - Task checklist
- \`clarify-session.md\` - Requirements from clarification phase
- \`.opencode/agent/\` - OpenCode agent configurations

## Learn More

See the main Ralph Wiggum documentation at:
https://github.com/RichardScottOZ/ralph-opencode
EOF

# Create .gitignore
echo -e "${YELLOW}Creating .gitignore...${NC}"
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
venv/
.venv/
__pycache__/

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Build outputs
dist/
build/
*.pyc
*.pyo

# Logs
*.log
logs/

# Environment
.env
.env.local
EOF

# Initial git commit
echo -e "${YELLOW}Creating initial git commit...${NC}"
git add .
git commit -m "Initial setup with Ralph Wiggum workflow for OpenCode"

# Success message
echo ""
echo -e "${GREEN}✅ Project setup complete!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. ${YELLOW}cd $PROJECT_NAME${NC}"
echo -e "  2. ${YELLOW}opencode${NC} - Start OpenCode"
echo -e "  3. Switch to ${YELLOW}ralph-clarify${NC} agent (Tab or @ralph-clarify) - Gather requirements"
echo -e "  4. Switch to ${YELLOW}ralph-plan${NC} agent - Generate execution files"
echo -e "  5. Switch to ${YELLOW}build${NC} agent - Execute tasks from TODO.md"
echo ""
echo -e "${BLUE}Project structure:${NC}"
tree -L 2 "$PROJECT_NAME" 2>/dev/null || find "$PROJECT_NAME" -maxdepth 2 -print | sed 's|[^/]*/| |g'
echo ""
echo -e "${GREEN}Happy coding with Ralph! 🤖${NC}"
