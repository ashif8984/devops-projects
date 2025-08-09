from fastapi import FastAPI
import os

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello:" f"From: {os.environ.get('HOSTNAME', 'DEFAULT_ENV')}"}