clean:
	rm -rf build build.zip
	rm -rf __pycache__

docker-build:
	docker-compose build

docker-run:
	docker-compose run lambda src.lambda_function.lambda_handler

build-lambda-package: clean
	mkdir build
	cp -r src build/.
	cp -r lib build/.
	pip install -r requirements.txt -t build/lib/.
	cd build; zip -9qr build.zip .
	cp build/build.zip ./dist
	rm -rf build