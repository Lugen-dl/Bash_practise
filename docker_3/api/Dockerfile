ARG PY_VER="3.12"
FROM python:${PY_VER}-slim AS builder

RUN apt-get update && \
    apt-get install --no-install-recommends \
    -y build-essential && \
    rm -rf /var/lib/apt/lists/*

ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv ${VIRTUAL_ENV}
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


WORKDIR /src

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

FROM python:3.12-slim AS production

COPY --from=builder /opt/venv /opt/venv

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
COPY . .

EXPOSE 3000

ENTRYPOINT [ "python" ] 
CMD [ "app.py" ]