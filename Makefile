


commit:
	git add .
	git commit -m "$(or $(m),Auto-commit: $(shell date))"
	git push

kalle:
	echo "Kalle is great!"

pelle:
	echo "Pelle is awesome!"
