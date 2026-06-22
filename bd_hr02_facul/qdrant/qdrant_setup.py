from qdrant_client import QdrantClient
from qdrant_client.models import Distance, VectorParams, PointStruct
from sentence_transformers import SentenceTransformer

QDRANT_URL = "https://f37bb299-7254-45f0-b8da-b0e267d91e59.us-west-2-0.aws.cloud.qdrant.io"
QDRANT_API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOiJtIiwic3ViamVjdCI6ImFwaS1rZXk6YmZkNWJmYzYtM2RjMC00OGQ1LWI4YTQtMjE0YTIzZjJhMDY1In0.gT4XKS5DqdB7VHsOo1ExDSI-f0RWT0oWE865eXazbUU"

client = QdrantClient(
    url=QDRANT_URL,
    api_key=QDRANT_API_KEY
)

model = SentenceTransformer("all-MiniLM-L6-v2")

collection_name = "reviews"

client.recreate_collection(
    collection_name=collection_name,
    vectors_config=VectorParams(
        size=384,
        distance=Distance.COSINE
    )
)

texts = [
    "Produto excelente e entrega rápida.",
    "Bom custo benefício.",
    "Qualidade muito acima da expectativa."
]

vectors = model.encode(texts)

points = []

for idx, (text, vector) in enumerate(zip(texts, vectors)):
    points.append(
        PointStruct(
            id=idx + 1,
            vector=vector.tolist(),
            payload={
                "review_text": text
            }
        )
    )

client.upsert(
    collection_name=collection_name,
    points=points
)

print("Embeddings enviados com sucesso.")