(require 'fidget').setup {
  text = {
    spinner = 'dots_toggle',
    done = '',
    commenced = 'Loading',
    completed = 'Completed',
  },
  align = {
    bottom = true,
    right = true,
  },
  timer = {
    spinner_rate = 500,
    fidget_decay = 1500,
    task_decay = 1000,
  },
  window = {
    relative = 'editor',
    blend = 0,
    zindex = nil,
    border = 'none',
  },
  fmt = {
    leftpad = true,
    stack_upwards = true,
    max_width = 0,
    fidget = function(fidget_name, spinner)
      return string.format('%s %s', spinner, fidget_name)
    end,
    task = function(task_name, message, percentage)
      return string.format(
        '%s%s [%s]',
        message,
        ((percentage and string.format(' (%s%%)', percentage)) or ''),
        task_name
      )
    end,
  },
  debug = {
    logging = false,
    strict = false,
  },
}
