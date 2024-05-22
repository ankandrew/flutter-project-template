# Directories
SRC_DIRS := lib test

# Dart source code files
DART_FILES := $(shell find $(SRC_DIRS) \
                 -name "*.dart" \
                 -not \( \
                   -name "*.*freezed.dart" \
                   -o -name "*.*g.dart" \
                 \))

# Flags
FORMAT_FLAGS := --line-length 100

# Tasks
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  help                 : Show this help message"
	@echo "  format               : Format code"
	@echo "  check_format         : Check code format"
	@echo "  lint                 : Run linter"
	@echo "  test                 : Run tests"
	@echo "  disable_analytics    : Disabling statistics and crash reports"
	@echo "  build_runner         : Run build_runner build."
	@echo "  clean                : Clean up caches and build artifacts"
	@echo "  checks               : Run format, lint, and test"

.PHONY: format
format:
	@echo "===> Fixing imports..."
	@dart fix --code=directives_ordering,always_use_package_imports --apply
	@echo "===> Formatting code..."
	@dart format $(FORMAT_FLAGS) $(DART_FILES)

.PHONY: check_format
check_format:
	@echo "===> Checking if code is formatted correctly..."
	@dart format --output none --set-exit-if-changed $(FORMAT_FLAGS) $(DART_FILES)

.PHONY: lint
lint:
	@echo "===> Running linter..."
	@flutter analyze $(DART_FILES)

.PHONY: test
test:
	@echo "===> Running test..."
	@flutter test --reporter github

.PHONY: disable_analytics
disable_analytics:
	@echo "===> Disabling statistics and crash reports..."
	@flutter config --no-analytics
	@dart --disable-analytics

.PHONY: build_runner
build_runner:
	@echo "===> Running build_runner build..."
	@dart run build_runner build

.PHONY: clean
clean:
	@echo "===> Cleaning Flutter project..."
	@flutter clean
	@cd ios && rm -rf Podfile.lock
	@cd ios && rm -rf Pods
	@flutter pub get

checks: format lint test
