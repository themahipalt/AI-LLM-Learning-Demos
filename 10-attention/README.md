# 10 — Attention

This folder contains the full single-page learning demo for **10 — Attention** in the AI / LLM learning sequence.

Live page file:

```text
index.html
```

Recommended folder:

```text
AI-LLM-Learning-Demos/
└── 10-attention/
    ├── index.html
    └── README.md
```

---

## Purpose

This chapter explains **Attention**, one of the most important ideas behind modern LLMs and Transformers.

The page is designed as a deep study chapter, not a short note. It keeps the complete reading flow, examples, manual calculations, visual intuition, and interactive demos in one place.

Main idea:

> Attention helps each token decide which other tokens are important, then mixes useful information to create a better context-aware meaning.

---

## Where this fits in the learning path

Previous topics completed:

```text
06 — Text as Data
07 — Tokens and Tokenization
08 — Embeddings
09 — Sequence Learning
```

Current topic:

```text
10 — Attention
```

Next topic:

```text
11 — Transformer
```

Attention is the bridge between **Sequence Learning** and **Transformers**.

---

## What this page covers

The page includes a full explanation of:

- Why Attention was needed
- The limitation of RNN / LSTM memory
- Hidden state bottleneck
- Human attention intuition
- Attention as selective focus
- Same word with different context
- Pronoun reference problem
- Attention scores
- Attention weights
- Softmax in Attention
- Weighted sum intuition
- Context vector
- Before Attention vs after Attention
- Query, Key, Value intuition
- Query-Key matching
- Dot product scoring
- Scaling by `√d`
- Self-Attention
- Attention Matrix
- Manual Q/K/V calculation
- All-token Attention Matrix calculation
- Masked / causal Attention
- No future cheating rule
- GPT-style next-token prediction
- Encoder vs Decoder Attention
- Multi-Head Attention
- Many heads as many learned lenses
- Attention inside the Transformer block
- Residual connection
- Layer normalization
- Feed-forward network after Attention
- Attention and next-token prediction
- Common misconceptions
- Quiz, answer key, final checklist
- Bridge to Transformer

---

## Interactive demos included

The page includes **5 interactive demos**, placed at the bottom after the reading chapter.

### 1. Word Focus Simulator

Shows that the same word can focus on different tokens depending on context.

Example:

```text
The dog chased the ball because it was rolling.
```

Here, `it` should mainly refer to `ball`.

Another sentence:

```text
The dog chased the ball because it was tired.
```

Here, `it` should mainly refer to `dog`.

This demo teaches:

```text
Attention = context-based focus
```

---

### 2. Tiny Attention Calculator

Shows a small numeric Attention calculation using:

```text
Deepak teaches AI
```

Tiny vectors:

| Token | Vector |
|---|---|
| Deepak | `[2, 1]` |
| teaches | `[1, 2]` |
| AI | `[2, 2]` |

For the token `teaches`, the demo shows:

```text
Q(teaches) = [1, 2]
```

Dot products:

```text
teaches → Deepak  = 4
teaches → teaches = 5
teaches → AI      = 6
```

Softmax result:

```text
[4, 5, 6] → [0.09, 0.24, 0.67]
```

Weighted sum:

```text
0.09 × [2,1] + 0.24 × [1,2] + 0.67 × [2,2]
= [1.76, 1.91]
```

This demo teaches:

```text
Scores → Softmax → Weights → Weighted sum
```

---

### 3. Attention Matrix Visualizer

Shows how every token attends to every token.

Example matrix:

| Current ↓ / Looking → | Deepak | teaches | AI |
|---|---:|---:|---:|
| Deepak | 0.24 | 0.09 | 0.67 |
| teaches | 0.09 | 0.24 | 0.67 |
| AI | 0.11 | 0.11 | 0.78 |

This demo teaches:

```text
Attention Matrix = who looks at whom and by how much
```

---

### 4. Masked Attention Playground

Shows why GPT-style models cannot look into the future.

Sentence:

```text
I love learning AI
```

Masked Attention rule:

| Token | Can look at |
|---|---|
| I | I |
| love | I, love |
| learning | I, love, learning |
| AI | I, love, learning, AI |

This demo teaches:

```text
Masked Attention = no future cheating
```

---

### 5. Multi-Head Lens Preview

Shows different Attention heads as different learned lenses.

Example sentence:

```text
The teacher gave the student a book because she wanted him to learn.
```

Possible relationships:

| Head | Possible focus |
|---|---|
| Head 1 | she → teacher |
| Head 2 | him → student |
| Head 3 | gave → book |
| Head 4 | learn → student |

This demo teaches:

```text
Multi-Head Attention = many learned relationship lenses
```

---

## Page design notes

The page uses the same deep-study style as the earlier learning demos.

Design decisions:

- Full reading material is kept inside the page.
- Demos are placed at the bottom after the reading chapter.
- A floating **Show / Hide Contents** button opens the contents panel.
- No left sidebar scroller.
- Text is compact enough for long reading.
- Sections are designed for study, revision, and future teaching.

---

## Key formulas explained

### Attention score

```text
Score = Query · Key
```

### Scaled dot-product Attention

```text
Attention(Q, K, V) = softmax(QKᵀ / √d) V
```

Simple meaning:

```text
Match Queries with Keys,
convert scores into weights,
then mix Values.
```

### Multi-Head Attention

```text
MultiHead(Q, K, V) = Concat(head1, head2, ..., headN) × Wo
```

Where:

```text
headᵢ = Attention(Qᵢ, Kᵢ, Vᵢ)
```

---

## Final learning takeaway

Attention is not just highlighting words.

It is a calculation that creates a new vector for each token:

```text
Attention = scores + softmax weights + weighted sum of values
```

The final result is:

```text
context-aware token meaning
```

For every token, Attention asks:

```text
What am I looking for?        → Query
What does each token contain? → Key
What should I collect?        → Value
```

Then it performs:

```text
Match → Weight → Mix → New Meaning
```

---

## Final checklist

After completing this chapter, the learner should be able to explain:

- Why Attention was needed
- What Attention score means
- What Attention weight means
- Why softmax is used
- What weighted sum does
- Query, Key, and Value
- Dot product matching
- Scaling by `√d`
- Self-Attention
- Attention Matrix
- Masked Attention
- Encoder vs Decoder Attention
- Multi-Head Attention
- Attention inside Transformer blocks
- Why Attention matters for next-token prediction

---

## Bridge to next topic

The next topic is:

```text
11 — Transformer
```

Now that Attention is clear, Transformer becomes easier to understand because Transformer is built around repeated blocks of:

```text
Self-Attention
Add & Normalize
Feed-Forward Network
Add & Normalize
```

Attention is the relationship engine inside the Transformer.

