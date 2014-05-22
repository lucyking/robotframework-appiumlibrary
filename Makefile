.PHONY: help

help:
	@echo targes: generate_doc, 

generate_doc: 
	VENV/bin/python -m robot.libdoc ./src/AppiumLibrary/ ./doc/AppimuLibrary.html

pypi_upload:clean_pyc
	rm -rf src/robotframework_appiumlibrary.egg-info/
	VENV/bin/python setup.py sdist upload

clean_pyc:
	find . -iname "*.pyc" -delete

andriod_demo:
	VENV/bin/pybot ./demo/test_andriod_demo.txt

ios_demo:
	VENV/bin/pybot ./demo/test_ios_demo.txt

demo:andriod_demo ios_demo

unittest:
	VENV/bin/py.test -s tests 

test:unittest

version:
	cat src/AppiumLibrary/version.py