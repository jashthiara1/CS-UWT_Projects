This program is an AI webscraper! by providing a website and a prompt, the LLM via ollama will bring back tailored results!
Extremely useful to expediate research and even create tables/sorting/running data analysis.
The website is made using Django, python, Streamlit (for simple webpage), and selenium to do the webscraping. 

to launch the program in windows firstly
1. open terminal and enter "python -m venv ai"
2. activate virtual environment by entering ".\AI\SCRIPTS\ACTIVATE.BAT
3. in terminal enter "pip install -r requirements.txt"
4. download ollama LLM -> https://ollama.com/
5. enter "ollama" into terminal
6. download model by entering "ollama pull llama3.1" into terminal
7. now the program is ready to scrape websites based on user prompts. Enter "streamlit run main.py" and the website will launch !