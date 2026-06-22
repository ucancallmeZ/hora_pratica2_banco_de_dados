from qdrant_client import QdrantClient
from sentence_transformers import SentenceTransformer

QDRANT_URL = "https://f37bb299-7254-45f0-b8da-b0e267d91e59.us-west-2-0.aws.cloud.qdrant.io"
QDRANT_API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOiJtIiwic3ViamVjdCI6ImFwaS1rZXk6YmZkNWJmYzYtM2RjMC00OGQ1LWI4YTQtMjE0YTIzZjJhMDY1In0.gT4XKS5DqdB7VHsOo1ExDSI-f0RWT0oWE865eXazbUU"

client = QdrantClient(
    url=QDRANT_URL,
    api_key=QDRANT_API_KEY
)

model = SentenceTransformer("all-MiniLM-L6-v2")

query = "produto com ótima qualidade"

query_vector = model.encode(query).tolist()

results = client.query_points(
    collection_name="reviews",
    query=query_vector,
    limit=3
)

print(results)