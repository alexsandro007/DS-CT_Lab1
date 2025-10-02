FROM python:3.12-slim AS builder

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --prefix=/install --no-cache-dir -r requirements.txt


FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /install /usr/local

COPY app/ .

RUN useradd -u 65532 -M appuser

USER appuser

EXPOSE 8043
HEALTHCHECK CMD curl --fail http://localhost:8043/live || exit 1

LABEL org.bstu.student.fullname="Yarmola Aleksandr Olegovich" \
      org.bstu.student.id="220028" \
      org.bstu.group="as-63" \
      org.bstu.variant="23" \
      org.bstu.course="RSIOT"

CMD ["gunicorn", "-b", "0.0.0.0:8043", "main:app"]
