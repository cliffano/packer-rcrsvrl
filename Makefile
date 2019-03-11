ci: clean tools deps lint docker-rcrsvrl

clean:
	rm -rf logs modules

deps:
	r10k puppetfile install --moduledir modules

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

docker-rcrsvrl:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-docker-rcrsvrl.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-rcrsvrl.json

docker-publish-rcrsvrl:
	docker push cliffano/rcrsvrl:latest

tools:
	gem install puppet-lint r10k

.PHONY: ci clean deps lint docker-rcrsvrl docker-publish-rcrsvrl tools
