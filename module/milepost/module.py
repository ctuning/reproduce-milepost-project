#
# Collective Knowledge (demonstrating MILEPOST technology powered by Collective Knowledge Framework)
#
# See CK LICENSE.txt for licensing details
# See CK COPYRIGHT.txt for copyright details
#
# Developer: Grigori Fursin, Grigori.Fursin@cTuning.org, http://fursin.net
#

cfg={}  # Will be updated by CK (meta description of this module)
work={} # Will be updated by CK (temporal data)
ck=None # Will be updated by CK (initialized CK kernel) 

# Local settings

hextra='<i><center>\n'
hextra+='This is a community-driven R&D: \n'
hextra+=' [ <a href="https://en.wikipedia.org/wiki/Collective_Knowledge_(software)">CK wikipedia</a> , \n'
hextra+=' <a href="https://en.wikipedia.org/wiki/MILEPOST_GCC">MILEPOST GCC</a> , \n'
hextra+=' <a href="https://hal.archives-ouvertes.fr/inria-00436029">Vision paper</a> , \n'
hextra+='<a href="https://www.researchgate.net/publication/304010295_Collective_Knowledge_Towards_RD_Sustainability">CK paper</a>, \n'
hextra+='<a href="https://arxiv.org/abs/1506.06256">Crowd-tuning</a>, \n'
hextra+='<a href="https://www.youtube.com/watch?v=Q94yWxXUMP0">YouTube intro</a> ] \n'
hextra+='</center></i>\n'

form_name='milepost_web_form'
onchange='document.'+form_name+'.submit();'

default_prog_uoa='sample-milepost-codelet'
prog_kernel_c='kernel.c'

##############################################################################
# Initialize module

def init(i):
    """

    Input:  {}

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """
    return {'return':0}

##############################################################################
# show dashboard

def show(i):
    """
    Input:  {
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """

    import os

    # State: extract
    ae=False
    if 'action_extract' in i: ae=True

    # State reset
    ar=False
    if 'action_reset' in i: 
       ar=True
       ae=False

    # Start HTML
    h=''
    h+='<center>\n'
    h+='\n\n<script language="JavaScript">function copyToClipboard (text) {window.prompt ("Copy to clipboard: Ctrl+C, Enter", text);}</script>\n\n' 

#    h+='<h2>Aggregated results from Caffe crowd-benchmarking (time, accuracy, energy, cost, ...)</h2>\n'

    h+=hextra

    # Check host URL prefix and default module/action
    rx=ck.access({'action':'form_url_prefix',
                  'module_uoa':'wfe',
                  'host':i.get('host',''), 
                  'port':i.get('port',''), 
                  'template':i.get('template','')})
    if rx['return']>0: return rx
    url0=rx['url']
    template=rx['template']

    url=url0
    action=i.get('action','')
    muoa=i.get('module_uoa','')

    st=''

    url+='action=index&module_uoa=wfe&native_action='+action+'&'+'native_module_uoa='+muoa
    url1=url

    # Start form
    r=ck.access({'action':'start_form',
                 'module_uoa':cfg['module_deps']['wfe'],
                 'url':url1,
                 'name':form_name})
    if r['return']>0: return r
    h+=r['html']

    # Header
    h+='<h2>Predict optimization using MILEPOST program features via CK (concept demo)</h2>\n'

    # First params
    h+='<table border="0" cellpadding="9" cellspacing="0">\n'

    h+=' <tr>\n'
    h+='  <td align="right" valign="top"><b>Program source code</b></td>\n'
    x=''

    # Get default program (to compare or reset)
    r=ck.access({'action':'load',
                 'module_uoa':cfg['module_deps']['program'],
                 'data_uoa':default_prog_uoa})
    if r['return']>0: return r
    dprog=r['dict']
    p=r['path']

    fn=os.path.join(p,prog_kernel_c)

    r=ck.load_text_file({'text_file':fn})
    if r['return']>0: return r

    default_prog=r['string'].strip()

    prog=i.get('program_sources','').strip()
    if prog=='' or ar:
       prog=default_prog

    y='width:600px;height:270px;'
        
    x='<textarea name="program_sources" style="'+y+'">\n'
    x+=prog+'\n'
    x+='</textarea>\n'

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr>\n'
    h+='  <td align="right"><b>Program language</b></td>\n'
    x=''

    dt=[{'name':'C', 'value':'CC'},
        {'name':'C++','value':'CXX'},
        {'name':'Fortran', 'value':'FC'},
       ]

    plang=i.get('program_language','')
    if plang=='' or ar: plang='CC'

    ii={'action':'create_selector',
        'module_uoa':cfg['module_deps']['wfe'],
        'data':dt,
        'name':'program_language',
        'onchange':onchange, 
        'skip_sort':'yes',
        'selected_value':plang}
    r=ck.access(ii)
    if r['return']>0: return r
    x=r['html']

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr>\n'
    h+='  <td align="right"><b>MILEPOST GCC flags</b></td>\n'
    x=''

    flags=i.get('milepost_flags','')
    if flags=='' or ar: flags='-O1'

    x='<input type="text" name="milepost_flags" value="'+flags+'">\n'

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr align="right">\n'
    h+='  <td><b>MILEPOST GCC pass to extrat features</b></td>\n'
    x=''

    mpass=i.get('milepost_pass','')
    if mpass=='' or ar: mpass='fre'

    x='<input type="text" name="milepost_pass" value="'+mpass+'">\n'

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr>\n'

    h+='</table>\n'

    # Buttons
    h+='<p><center>\n'
    h+='<button type="submit" name="action_extract">Extract features</button>\n'
    h+='<button type="submit" name="action_reset">Reset</button>\n'
    h+='</center>\n'

    # If extract
    if ae:
       if prog!=default_prog:
          # Create dummy copy
          dprog['compiler_env']='CK_'+plang

          r=ck.access({'action':'add',
                       'module_uoa':cfg['module_deps']['program'],
                       'dict':dprog})
          if r['return']>0: return r
          prog_uid=r['data_uid']
          prog_path=r['path']

          fn=os.path.join(prog_path,prog_kernel_c)

          r=ck.save_text_file({'text_file':fn, 'string':prog})
          if r['return']>0: return r

          


    return {'return':0, 'html':h, 'style':st}

##############################################################################
# open dashboard

def dashboard(i):
    """
    Input:  {
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """

    i['action']='browser'
    i['cid']=''
    i['module_uoa']=''
    i['extra_url']='native_action=show&native_module_uoa=milepost'

    return ck.access(i)
