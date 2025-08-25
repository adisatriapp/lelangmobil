# Robot Framework Test Automation Project

This project contains automated tests for web applications using Robot Framework with Selenium WebDriver.

## Project Structure

```
robot-lelangmobil/
├── .github/workflows/     # GitHub Actions workflows
├── locators/              # Page object locators
├── resources/             # Robot Framework resources and keywords
├── test_data/            # Test data files
├── tests/                # Test suite files
└── requirements.txt       # Python dependencies
```

## Test Suites

- **1-register.robot**: User registration flow tests
- **2-login.robot**: User authentication tests

## GitHub Actions Workflow

The project includes a comprehensive GitHub Actions workflow (`.github/workflows/robot-tests.yml`) that:

### 🧪 Test Execution
- Runs tests on multiple Python versions (3.9, 3.10, 3.11)
- Tests on multiple browsers (Chrome, Firefox)
- Generates detailed HTML reports and logs
- Uploads test artifacts for review

### 🔍 Code Quality
- **Linting**: Uses `robotframework-lint` to check code quality
- **Formatting**: Uses `robotidy` to format Robot files
- **Security**: Runs Bandit and Safety security scans

### 📊 Reporting
- Generates test execution reports
- Comments on Pull Requests with test results
- Provides downloadable test artifacts

## Local Development

### Prerequisites
- Python 3.9+
- pip package manager

### Installation
```bash
# Clone the repository
git clone <your-repo-url>
cd robot-lelangmobil

# Install dependencies
pip install -r requirements.txt
```

### Running Tests Locally
```bash
# Run all tests
robot tests/

# Run specific test suite
robot tests/1-register.robot

# Run with specific output directory
robot --outputdir results tests/

# Run with parallel execution
pabot tests/
```

### Test Data Configuration
Update the test data files in `test_data/` directory:
- `data-auth.py`: Authentication credentials
- `data-diri.py`: Personal information data
- `data-url.py`: Application URLs
- `data-profilsaya.py`: Profile data

## Browser Setup

The tests require Chrome or Firefox browsers. The GitHub Actions workflow automatically installs these browsers on Ubuntu runners.

For local development, ensure you have:
- Chrome/Chromium browser installed
- Firefox browser installed
- Appropriate WebDriver executables in your PATH

## Continuous Integration

The workflow triggers on:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches
- Manual workflow dispatch

## Test Reports

After test execution, the following artifacts are generated:
- `report.html`: Test execution summary
- `log.html`: Detailed test execution log
- `output.xml`: Robot Framework output in XML format

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Ensure tests pass locally
5. Submit a pull request

The GitHub Actions workflow will automatically run tests and provide feedback on your changes.

## Troubleshooting

### Common Issues
- **Browser not found**: Ensure Chrome/Firefox is installed and WebDriver is in PATH
- **Test failures**: Check test data files and application availability
- **Dependency issues**: Verify Python version compatibility and reinstall requirements

### Getting Help
- Check the generated test reports for detailed error information
- Review the GitHub Actions logs for CI/CD issues
- Ensure all test data files are properly configured
