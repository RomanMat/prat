# Build step
### Reference https://github.com/astral-sh/uv/pkgs/container/uv/378681983?tag=0.6.9-python3.12-bookworm-slim
FROM ghcr.io/astral-sh/uv:0.6.9-python3.12-bookworm-slim@sha256:4b5c63875e2380dd3623bd61030cb18e3b31f723dcdcd2828e30968758ca5de2 AS builder

ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy 

ENV UV_PYTHON_DOWNLOADS=0

WORKDIR /app
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev
COPY uv.lock pyproject.toml /app/
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

FROM python:3.12-slim-bookworm AS production

COPY --from=builder --chown=app:app /app /app
ADD /app /app

ENV PATH="/app/.venv/bin:$PATH"

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

