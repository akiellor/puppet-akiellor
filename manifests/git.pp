class akiellor::git {
  git::config::global { 'push.default':
    value => 'simple',
  }

  git::config::global { 'alias.st': value => 'status' }
  git::config::global { 'alias.purr': value => 'pull --rebase' }
  git::config::global { 'alias.df': value => 'diff' }
  git::config::global { 'alias.dc': value => 'diff --staged' }
}
