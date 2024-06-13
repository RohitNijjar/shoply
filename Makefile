#function
clean_pub_get_run:
	@echo "cleaning"
	flutter clean

	@echo "getting the dependencies"
	flutter pub get

models: ## This command generates models for freezed and json_serializable
	dart run build_runner build --delete-conflicting-outputs	

lint: ## Analyzes the codebase for issues
	flutter analyze
	dart analyze .

.PHONY:clean_pub_get_run models lint