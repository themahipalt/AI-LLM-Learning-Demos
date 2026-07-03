@echo off
setlocal

REM =====================================================
REM Restructure AI-LLM-Learning-Demos learning path
REM Run this file from:
REM C:\GoogleDrive\TheAI\AI-LLM-Learning-Demos
REM =====================================================

cd /d "%~dp0"

echo.
echo =====================================================
echo Restructuring AI Learning Demo folders...
echo Current folder:
cd
echo =====================================================
echo.

REM -----------------------------------------------------
REM Step 1: Move old folders to temporary names first
REM This avoids number collision like 06-transformer already existing
REM -----------------------------------------------------

call :safeRename "01-text-as-data" "__tmp_06-text-as-data"
call :safeRename "02-tokenization" "__tmp_07-tokens-tokenization"
call :safeRename "03-embeddings" "__tmp_08-embeddings"
call :safeRename "04-sequence-learning" "__tmp_09-sequence-learning"
call :safeRename "05-attention" "__tmp_10-attention"
call :safeRename "06-transformer" "__tmp_11-transformer"
call :safeRename "07-pretraining-next-token" "__tmp_12-pretraining-next-token"
call :safeRename "08-prompting" "__tmp_13-prompting"
call :safeRename "09-rag" "__tmp_14-rag"
call :safeRename "10-tool-calling" "__tmp_15-tool-calling"
call :safeRename "11-agents" "__tmp_16-agents"

REM -----------------------------------------------------
REM Step 2: Move temporary folders to final new names
REM -----------------------------------------------------

call :safeRename "__tmp_06-text-as-data" "06-text-as-data"
call :safeRename "__tmp_07-tokens-tokenization" "07-tokens-tokenization"
call :safeRename "__tmp_08-embeddings" "08-embeddings"
call :safeRename "__tmp_09-sequence-learning" "09-sequence-learning"
call :safeRename "__tmp_10-attention" "10-attention"
call :safeRename "__tmp_11-transformer" "11-transformer"
call :safeRename "__tmp_12-pretraining-next-token" "12-pretraining-next-token"
call :safeRename "__tmp_13-prompting" "13-prompting"
call :safeRename "__tmp_14-rag" "14-rag"
call :safeRename "__tmp_15-tool-calling" "15-tool-calling"
call :safeRename "__tmp_16-agents" "16-agents"

REM -----------------------------------------------------
REM Step 3: Create missing folders
REM Each folder will keep index.html and README.md
REM -----------------------------------------------------

call :ensureDemoFolder "00-ai-learning-status"
call :ensureDemoFolder "01-ml-basic-idea"
call :ensureDemoFolder "02-linear-regression"
call :ensureDemoFolder "03-logistic-regression"
call :ensureDemoFolder "04-neural-network-basic"
call :ensureDemoFolder "05-ml-to-llm-bridge"
call :ensureDemoFolder "06-text-as-data"
call :ensureDemoFolder "07-tokens-tokenization"
call :ensureDemoFolder "08-embeddings"
call :ensureDemoFolder "09-sequence-learning"
call :ensureDemoFolder "10-attention"
call :ensureDemoFolder "11-transformer"
call :ensureDemoFolder "12-pretraining-next-token"
call :ensureDemoFolder "13-prompting"
call :ensureDemoFolder "14-rag"
call :ensureDemoFolder "15-tool-calling"
call :ensureDemoFolder "16-agents"

REM -----------------------------------------------------
REM Step 4: Ensure assets/data exists
REM -----------------------------------------------------

if not exist "assets" mkdir "assets"
if not exist "assets\data" mkdir "assets\data"

REM -----------------------------------------------------
REM Step 5: Update demos.json with full ML to LLM path
REM -----------------------------------------------------

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$json = @'
[
  {
    ""id"": ""00"",
    ""title"": ""AI Learning Status Dashboard"",
    ""status"": ""Planned"",
    ""level"": ""Beginner"",
    ""description"": ""Track the full journey from ML basics to LLMs, RAG, Tool Calling and Agents."",
    ""path"": ""00-ai-learning-status/index.html""
  },
  {
    ""id"": ""01"",
    ""title"": ""Machine Learning Basic Idea"",
    ""status"": ""Done / To convert"",
    ""level"": ""Beginner"",
    ""description"": ""Understand ML as learning patterns from data instead of writing fixed rules."",
    ""path"": ""01-ml-basic-idea/index.html""
  },
  {
    ""id"": ""02"",
    ""title"": ""Linear Regression"",
    ""status"": ""Done / To convert"",
    ""level"": ""Beginner"",
    ""description"": ""Learn how input features are used to predict a numeric output using a line or plane."",
    ""path"": ""02-linear-regression/index.html""
  },
  {
    ""id"": ""03"",
    ""title"": ""Logistic Regression"",
    ""status"": ""Done / To convert"",
    ""level"": ""Beginner"",
    ""description"": ""Learn probability-based classification using sigmoid, decision boundary and class prediction."",
    ""path"": ""03-logistic-regression/index.html""
  },
  {
    ""id"": ""04"",
    ""title"": ""Neural Network Basic"",
    ""status"": ""Done / To convert"",
    ""level"": ""Beginner"",
    ""description"": ""Understand inputs, weights, hidden layers, activation and output using a visual neural network demo."",
    ""path"": ""04-neural-network-basic/index.html""
  },
  {
    ""id"": ""05"",
    ""title"": ""ML to LLM Bridge"",
    ""status"": ""Done / To convert"",
    ""level"": ""Beginner"",
    ""description"": ""Connect ML and neural network understanding to how LLMs process language."",
    ""path"": ""05-ml-to-llm-bridge/index.html""
  },
  {
    ""id"": ""06"",
    ""title"": ""Text as Data"",
    ""status"": ""Done"",
    ""level"": ""Beginner"",
    ""description"": ""Understand how human text becomes machine-readable data using preparation, vocabulary, IDs, sequences and simple vectors."",
    ""path"": ""06-text-as-data/index.html""
  },
  {
    ""id"": ""07"",
    ""title"": ""Tokens and Tokenization"",
    ""status"": ""Next"",
    ""level"": ""Beginner"",
    ""description"": ""Learn how text is split into tokens before going into an LLM."",
    ""path"": ""07-tokens-tokenization/index.html""
  },
  {
    ""id"": ""08"",
    ""title"": ""Embeddings"",
    ""status"": ""Pending"",
    ""level"": ""Beginner"",
    ""description"": ""Learn how token IDs become vectors that capture meaning-like relationships."",
    ""path"": ""08-embeddings/index.html""
  },
  {
    ""id"": ""09"",
    ""title"": ""Sequence Learning"",
    ""status"": ""Pending"",
    ""level"": ""Beginner"",
    ""description"": ""Understand why word order matters and how text behaves like sequence data."",
    ""path"": ""09-sequence-learning/index.html""
  },
  {
    ""id"": ""10"",
    ""title"": ""Attention"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Learn how models decide which words or tokens should focus on each other."",
    ""path"": ""10-attention/index.html""
  },
  {
    ""id"": ""11"",
    ""title"": ""Transformer"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Understand the architecture behind modern LLMs."",
    ""path"": ""11-transformer/index.html""
  },
  {
    ""id"": ""12"",
    ""title"": ""Pretraining and Next Token Prediction"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Learn how LLMs are trained to predict the next token from large text data."",
    ""path"": ""12-pretraining-next-token/index.html""
  },
  {
    ""id"": ""13"",
    ""title"": ""Prompting"",
    ""status"": ""Pending"",
    ""level"": ""Beginner"",
    ""description"": ""Understand how instructions, examples, context and format guide LLM behavior."",
    ""path"": ""13-prompting/index.html""
  },
  {
    ""id"": ""14"",
    ""title"": ""RAG"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Learn how retrieval augmented generation connects external knowledge to LLMs."",
    ""path"": ""14-rag/index.html""
  },
  {
    ""id"": ""15"",
    ""title"": ""Tool Calling"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Understand how LLMs use external tools, APIs and functions."",
    ""path"": ""15-tool-calling/index.html""
  },
  {
    ""id"": ""16"",
    ""title"": ""Agents"",
    ""status"": ""Pending"",
    ""level"": ""Intermediate"",
    ""description"": ""Learn how LLMs can plan, use tools, remember steps and act toward goals."",
    ""path"": ""16-agents/index.html""
  }
]
'@; Set-Content -Path 'assets\data\demos.json' -Value $json -Encoding UTF8"

echo.
echo =====================================================
echo Restructure completed.
echo Folder structure is now ML to LLM path.
echo demos.json updated.
echo =====================================================
echo.

pause
exit /b


REM =====================================================
REM Helper: Safe rename
REM =====================================================
:safeRename
set "OLD=%~1"
set "NEW=%~2"

if exist "%OLD%" (
  if exist "%NEW%" (
    echo Skipped rename: "%OLD%" because "%NEW%" already exists.
  ) else (
    echo Renaming "%OLD%" to "%NEW%"
    ren "%OLD%" "%NEW%"
  )
) else (
  echo Not found, skipping: "%OLD%"
)
exit /b


REM =====================================================
REM Helper: Ensure demo folder with index.html and README.md
REM =====================================================
:ensureDemoFolder
set "FOLDER=%~1"

if not exist "%FOLDER%" (
  echo Creating folder: "%FOLDER%"
  mkdir "%FOLDER%"
)

if not exist "%FOLDER%\index.html" (
  type nul > "%FOLDER%\index.html"
)

if not exist "%FOLDER%\README.md" (
  type nul > "%FOLDER%\README.md"
)

exit /b