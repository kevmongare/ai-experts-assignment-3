FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["pytest", "-v"]
```

4. Scroll down to **"Commit changes"**
5. Use this commit message:
```
Add Dockerfile for CI-style test execution
