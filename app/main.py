from fastapi import FastAPI
from datetime import datetime
from pydantic import BaseModel, Field
from enum import Enum

class HealthStatus(Enum):
    healthy = 'healthy'
    degraded = 'degraded'
    down = 'down'

class Health(BaseModel):
    status: HealthStatus = Field(examples=[HealthStatus.healthy])
    timestamp: str = Field(default_factory=lambda: datetime.now().isoformat(), examples=["2025-03-22T12:34:56.789Z"])

app = FastAPI()

@app.get('/health', response_model=Health)
async def health() -> Health:    
    return Health(status=HealthStatus.healthy)

@app.get('/ready', response_model=Health)
async def ready() -> Health: return Health(status=HealthStatus.healthy)
