# Explanation

## What was the bug?

In `app/http_client.py`, the condition that decides whether to refresh the token
was only checking for `None` or an expired `OAuth2Token`. If the token happened
to be a plain dictionary, the check silently skipped the refresh entirely, and
the request went out with no `Authorization` header.

## Why did it happen?

A non-empty dictionary is truthy in Python, so `not self.oauth2_token` evaluated
to `False` and the refresh was skipped. The second part of the condition only
ran for `OAuth2Token` instances, so a dict-typed token fell through both checks
undetected.

## Why does the fix solve it?

The new condition checks whether the token is actually a valid `OAuth2Token`
instance first. If it is not - regardless of whether it is `None`, a dict, or
anything else - a refresh is triggered. This makes the logic explicit and covers
all unexpected token types in one clean check.

## One edge case the tests still don't cover

A token that expires in the middle of a request - where it passes the freshness
check but has already expired by the time the header is attached. In a
multi-threaded setup this could lead to an expired token being sent out.
