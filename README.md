# open.vim

## TL;DR;

Open.vim is a vim plugin that makes the default `gf` binding a little smarter.

## Configuration

To configure open.vim, you need to give it a collection of matcher/handler pairs. A matcher is just
a regex pattern, and a handler is just a string that will be executed if/when that regex matches. An
example configuration looks like this:

```{.vim}
let g:open_vim_patterns = [
      \ ["^/.*", "norm! gf"], " if it looks like a file, open the file
      \ ["^http://.*", "!firefox '<VALUE>'"] " if it looks like a url open that url in firefox
      \ ["[A-Z][A-Z]*-[0-9][0-9]*", "!firefox 'https://jira.corporate.intranet/browse/<VALUE>'"], " if it looks like a jira ticket id, open it in jira
      \ ]
```

`gf` will then try each matcher in order, and execute the handler corresponding to the first
matching matcher (with `'<VALUE>'` replaced with the matched string).

If you'd rather configure your own binding, you can set `g:open_vim_no_bindings` to something non
zero and open.vim won't create any bindings. In that case, the only function you need to use is
`open#handle(word)`, where word is the string that will be matched against.
