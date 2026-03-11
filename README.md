# AI Experts Assignment (Python)

This assignment evaluates your ability to:

- set up a small Python project to run reliably (locally + in Docker),
- pin dependencies for reproducible installs,
- write focused tests to reproduce a bug,
- implement a minimal, reviewable fix.

## Running Tests Locally

**Prerequisites:** Python 3.10+ and pip.
```bash
pip install -r requirements.txt
pytest -v
```

## Running Tests with Docker
```bash
# Build the image
docker build -t ai-assignment .

# Run the test suite
docker run --rm ai-assignment
```

## Constraints

- Keep changes minimal and reviewable.
- Do not refactor unrelated code.
- Do not introduce extra tooling unless required.
- You may add tests and the smallest code change needed to fix the bug.

## Submission

Submit a public GitHub repository URL containing your solution via the provided Google Form.
```

4. Commit message:
```
Update README with local and Docker test instructions
