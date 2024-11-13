import requests

def test_hello_world():
    response =  requests.get('http://172.17.0.3:5000')
    assert response.status_code == 200
    assert response.text == 'Hello World!'