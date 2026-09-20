from flask import Flask
import redis
import os

app = Flask(__name__)

redis_host = os.getenv("REDIS_HOST", "redis")

cache = redis.Redis(
    host=redis_host,
    port=6379,
    decode_responses=True
)


@app.route("/")
def home():
    visits = cache.incr("visits")

    return f"""
    <h1>Docker Compose Multi-Container App</h1>
    <p>Application is running successfully.</p>
    <p>Page visits: {visits}</p>
    """


@app.route("/health")
def health():
    try:
        cache.ping()
        return {"status": "healthy"}, 200

    except redis.RedisError:
        return {"status": "unhealthy"}, 503


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000
    )