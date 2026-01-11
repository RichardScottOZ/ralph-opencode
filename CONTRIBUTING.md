# Contributing to Ralph-OpenCode

Thank you for your interest in contributing to the Ralph Wiggum workflow for OpenCode! This document provides guidelines for contributing.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion:

1. Check if the issue already exists in the [issue tracker](https://github.com/RichardScottOZ/ralph-opencode/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - OpenCode version
   - Operating system

### Suggesting Enhancements

We welcome suggestions for improvements:

1. Open an issue with the "enhancement" label
2. Describe the enhancement clearly
3. Explain why it would be useful
4. Provide examples if possible

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Test your changes
5. Commit with clear messages: `git commit -m "Add: feature description"`
6. Push to your fork: `git push origin feature/your-feature-name`
7. Open a pull request

### Code Style

- Follow existing code style and conventions
- Keep agent instructions clear and concise
- Test agent configurations before submitting
- Update documentation for any changes

### Agent Contributions

If contributing new agents:

1. Place them in `.opencode/agent/`
2. Use markdown format with proper frontmatter
3. Include clear descriptions
4. Test thoroughly
5. Document in README.md

### Documentation

- Keep README.md up to date
- Update QUICKSTART.md if workflow changes
- Add examples when helpful
- Use clear, friendly language

## Development Setup

```bash
# Clone the repository
git clone https://github.com/RichardScottOZ/ralph-opencode.git
cd ralph-opencode

# Test the setup script
./setup-ralph.sh test-project

# Test agents in OpenCode
cd test-project
opencode
```

## Testing

Before submitting:

1. Test setup script works correctly
2. Test all agents in OpenCode
3. Verify generated files are correct
4. Check that examples work
5. Review documentation

## Questions?

Feel free to open an issue for questions or join the discussion in existing issues.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Acknowledgments

- **Geoffrey Huntley** - Original Ralph Wiggum technique
- **OpenCode Team** - OpenCode AI coding agent
- **Contributors** - Everyone who contributes to this project

Thank you for helping improve Ralph-OpenCode!
