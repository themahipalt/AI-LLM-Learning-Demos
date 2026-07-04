# 07 — Tokens and Tokenization

This demo explains one of the most important foundation concepts in Large Language Models:

> LLMs do not directly read human text. They read tokens.

Tokenization is the process of breaking text into smaller pieces called **tokens**, converting those tokens into **token IDs**, and then passing those IDs into the model as numerical inputs.

---

## Learning Goal

By the end of this demo, the learner should understand:

- What a token is
- Why tokens are not always equal to words
- Difference between word tokenization and subword tokenization
- How tokens are converted into token IDs
- Why context window is measured in tokens
- Why API cost and response speed depend on input and output tokens

---

## Big Idea

Human text:

```txt
I am learning tokenization