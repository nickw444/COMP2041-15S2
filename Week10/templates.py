#!/usr/bin/env python

class TemplateHandler(object):
    def __init__(self, templates_dir='.'):
        from jinja2 import Environment, FileSystemLoader
        super(TemplateHandler, self).__init__()   
        self.env = Environment(loader=FileSystemLoader(templates_dir), autoescape=True)
    def add_global(self, name, func):
        """
        Add a global variable to the template context. 
        Very useful to also add function pointers to the context

        {{ myGlobal }}
        {{ myGlobalFunction }}

        """
        self.env.globals[name] = func

    def add_filter(self, name, f):
        """
        Add a filter to the template context:

        {{ myVariable | myFilter }}
        """
        self.env.filters[name] = f

    def render_template(self, template_name, **kwargs):
        """
        Render a template with the given template name.
        """
        template = self.env.get_template(template_name)
        return template.render(kwargs)

template_handler = TemplateHandler(templates_dir='.')
render_template = template_handler.render_template

def main(argv):
    # Send the Header
    print('Content-type: text/html\r\n\r\n')

    # Return the rendered template
    print(render_template('sub.html', the_variable='1234'))

if __name__ == '__main__':
    import sys
    main(sys.argv)
