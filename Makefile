all: server client

server: main.go config.go message.go file.go sync.go
	go build -o server

client: client.go config.go custom.go message.go file.go sync.go
	go build -o client -tags client

test:
	@for i in *_test.go ; do \
		go test -tags `basename $$i _test.go` ; \
	done

clean:
	rm -f server client
