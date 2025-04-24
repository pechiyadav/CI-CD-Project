from fastapi import FastAPI
from datetime import datetime

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from GitLab CI/CD demo!"}

@app.get("/time")
def get_time():
    return {"server_time": datetime.utcnow().isoformat()}

@app.get("/healthz")
def health():
    return {"status": "ok"}
