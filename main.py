from fastapi import FastAPI, HTTPException, Header, Depends
from fastapi.security import APIKeyHeader
from pydantic import BaseModel, Field
from datetime import datetime, timedelta
import jwt
from typing import Optional

# Configuración
app = FastAPI()
header_scheme = APIKeyHeader(name="X-Parse-REST-API-Key")
API_KEY = "2f5ae96c-b558-4c7b-a590-a501ae1c3f6c"
SECRET_KEY = "jwt"
ALGORITHM = "HS256"


class DevOpsRequest(BaseModel):
    message: str
    to: str
    from_: str = Field(..., alias="from")
    timeToLifeSec: int


class DevOpsResponse(BaseModel):
    message: str


# Generador de JWT
@app.post("/token")
def crear_jwt() -> str:
    expiration = datetime.utcnow() + timedelta(minutes=30)
    payload = {"exp": expiration}
    encoded = jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM)
    return encoded


@app.post("/DevOps", response_model=DevOpsResponse)
async def devops(
        request: DevOpsRequest,
        api_key: str = Depends(header_scheme),
        x_jwt_kwy: Optional[str] = Header(None)
):
    if api_key != API_KEY:
        raise HTTPException(status_code=403, detail="Invalid API Key")
    if not x_jwt_kwy:
        x_jwt_kwy = crear_jwt()

    return {
        "message": f"Hello {request.to} your message will be send"
    }


# Manejo de otros métodos HTTP
@app.api_route("/DevOps", methods=["GET", "PUT", "DELETE", "PATCH"])
async def metodo_invalido():
    return "ERROR"
