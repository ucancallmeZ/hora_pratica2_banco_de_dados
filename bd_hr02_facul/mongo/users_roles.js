db.createUser({
 user:"viewer",
 pwd:"SenhaForte123",
 roles:[{role:"read",db:"reviews_db"}]
});

db.createUser({
 user:"analista",
 pwd:"SenhaForte123",
 roles:[{role:"readWrite",db:"reviews_db"}]
});