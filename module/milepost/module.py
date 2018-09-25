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

hextra='<center>\n'
hextra+='This is a community-driven R&D: \n'
hextra+=' [ <a href="https://en.wikipedia.org/wiki/Collective_Knowledge_(software)">CK wiki</a> , \n'
hextra+=' <a href="https://en.wikipedia.org/wiki/MILEPOST_GCC">MILEPOST GCC wiki</a> , \n'
hextra+=' <a href="https://github.com/ctuning/reproduce-milepost-project">CK-MILEPOST GitHub</a> , \n'
hextra+=' vision papers (<a href="https://hal.archives-ouvertes.fr/inria-00436029">cTuning</a> , \n'
hextra+=' <a href="https://scholar.google.com/citations?view_op=view_citation&hl=en&user=IwcnpkwAAAAJ&citation_for_view=IwcnpkwAAAAJ:LkGwnXOMwfcC">MILEPOST GCC</a> , \n'
hextra+=' <a href="https://arxiv.org/abs/1506.06256">crowd-tuning</a>, \n'
hextra+=' <a href="https://www.researchgate.net/publication/304010295_Collective_Knowledge_Towards_RD_Sustainability">CK</a>), \n'
hextra+='<a href="https://www.youtube.com/watch?v=Q94yWxXUMP0">YouTube intro</a> ]<br> \n'

hextra+='<br><i>Optimizations results are continuously shared by volunteers across diverse programs, data sets and platforms (also contributed by the community in the CK format): '
hextra+='<a href="http://cknowledge.org/repo/web.php?native_action=show&native_module_uoa=program.optimization&scenario=8289e0cf24346aa7">GCC</a> , \n'
hextra+='<a href="http://cknowledge.org/repo/web.php?native_action=show&native_module_uoa=program.optimization&scenario=2aaed4c520956635">LLVM</a></i> \n'

hextra+='</center>\n'

default_prog_uoa='sample-milepost-codelet'
prog_kernel_c='kernel.c'

ici1='ici_features_function.main.'
ici2='ici_passes_function.main.txt'

file_features='features.P'
file_features_out='features.FT'

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

              (predicted_opt) - MILEPOST prediction if features are provided and one configuration identified
            }

    """

    import os
    import shutil
    import time
    import copy

    form_name='milepost_web_form'

    sh=i.get('skip_html','')

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

#    import json
#    h+=json.dumps(i,sort_keys=True)

    h+=hextra
    st=''

    if i.get('widget','')=='yes':
       url0=i.get('prepared_url0','')
       url1=i.get('prepared_url1','')
       form_name=i.get('prepared_form_name','')
    else:
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

       url+='action=index&module_uoa=wfe&native_action='+action+'&'+'native_module_uoa='+muoa
       url1=url

       # Start form
       r=ck.access({'action':'start_form',
                    'module_uoa':cfg['module_deps']['wfe'],
                    'url':url1,
                    'name':form_name})
       if r['return']>0: return r
       h+=r['html']

    url=url0
    onchange='document.'+form_name+'.submit();'

    # Header
    h+='<h2>Predict optimization using MILEPOST program features via CK (CK JSON API demo)</h2>\n'

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
    prog_path=r['path']

    default_prog_uid=r['data_uid']

    fn=os.path.join(p,prog_kernel_c)

    r=ck.load_text_file({'text_file':fn})
    if r['return']>0: return r

    default_prog=r['string'].replace('\\r','').strip()

    prog=i.get('program_sources','').replace('\\r','').strip()
    # Strange size, so save file and load it again
    rx=ck.gen_tmp_file({'prefix':'tmp-', 'suffix':'.tmp'})
    if rx['return']>0: return rx
    ftmp=rx['file_name']

    r=ck.save_text_file({'text_file':ftmp, 'string':prog})
    if r['return']>0: return r

    r=ck.load_text_file({'text_file':ftmp, 'delete_after_read':'yes'})
    if r['return']>0: return r
    prog=r['string']

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

    flags=safe_str(flags)

    x='<input type="text" name="milepost_flags" value="'+flags+'">\n'

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr align="right">\n'
    h+='  <td><b>MILEPOST GCC pass to extract features</b></td>\n'
    x=''

    mpass=i.get('milepost_pass','')
    if mpass=='' or ar: mpass='fre'

    mpass=safe_str(mpass)

    x='<input type="text" name="milepost_pass" value="'+mpass+'">\n'

    h+='  <td align="left">'+x+'</td>\n'

    h+=' <tr>\n'

    h+='</table>\n'

    # Buttons
    h+='<p><center>\n'
    h+='<button type="submit" name="action_extract">Extract features</button>\n'
    h+='<button type="submit" name="action_reset">Reset</button>\n'
    h+='</center>\n'

    # Check features from cmd
    features={}
    if not ar:
       for k in i:
           if k.startswith('mft'):
              features[k[1:]]=i[k]

    # If extract
    if ae:
       if prog!=default_prog:
          # Create dummy copy
          dprog['compiler_env']='CK_'+plang

          ii={'action':'add',
              'module_uoa':cfg['module_deps']['program'],
              'dict':dprog}
          rlru=ck.cfg.get('record_local_repo_uoa','')
          if rlru!='':
             ii['repo_uoa']=rlru

          r=ck.access(ii)
          if r['return']>0: return r
          prog_uid=r['data_uid']
          prog_path=r['path']

          fn=os.path.join(prog_path,prog_kernel_c)

          r=ck.save_text_file({'text_file':fn, 'string':prog})
          if r['return']>0: return r
       else:
          prog_uid=default_prog_uid

       # Remove tmp dir
       px=os.path.join(prog_path,'tmp')
       if os.path.isdir(px): 
          shutil.rmtree(px)
          time.sleep(1)

       # Compile
       r=ck.access({'action':'compile',
                    'module_uoa':cfg['module_deps']['program'],
                    'data_uoa':prog_uid,
                    'flags':'--ct-extract-features '+flags,
                    'env':{'ICI_PROG_FEAT_PASS':mpass}})
       if r['return']>0: 
          h+='<p><center><b>Compilation failed: '+r['error']+'<br></center>\n'
          prog_uid=''
       else:   
          r=ck.access({'action':'load',
                       'module_uoa':cfg['module_deps']['program'],
                       'data_uoa':prog_uid})
          if r['return']>0: return r
          prog_path=r['path']

          f1=os.path.join(prog_path,'tmp',ici1+mpass+'.ft')
          f2=os.path.join(prog_path,'tmp',ici2)

          if not os.path.isfile(f1) or not os.path.isfile(f2):
             h+='<p>WARNING: features were not extracted - file with features is not found!\n'
          else:
             r=ck.load_text_file({'text_file':f1})
             if r['return']>0: return r
             s1=r['string'].strip()
          
             r=ck.load_text_file({'text_file':f2})
             if r['return']>0: return r
             s2=r['string'].strip()

             h+='<hr><b>Passes during feature extration:</b><br>\n'
             h+='<p>'+s2+'<br>'

             # Parse features
             fx=s1.split(',')
             for q in fx:
                 qq=q.strip().split('=')
                 if len(qq)==2:
                    k=qq[0][2:]
                    v=float(qq[1])

                    features['ft'+str(k)]=v

          h+='</center>\n'

    # Show features
    r=ck.access({'action':'load',
                 'module_uoa':cfg['module_deps']['module'],
                 'data_uoa':cfg['module_deps']['program.static.features']})
    if r['return']>0: return r

    d=r['dict']

    ml1=d.get('milepost_description_ctuning_page','')
    ml2=d.get('milepost_features_description',{})
    ml3=d.get('milepost_normalization_feature','')

    h+='<hr><p><center><h3><a href="http://ctuning.org/wiki/index.php/CTools:MilepostGCC:StaticFeatures:MILEPOST_V2.1">MILEPOST features</a> (main function)</h3>\n'

    h+='<table border="1" cellpadding="5" cellspacing="0">\n'
    h+=' <tr><td><b>Feature</b></td><td><b>Description</b></td></tr>\n'

    for k in sorted(ml2, key=lambda x: int(x)):
        q=ml2[k]
        desc=q.get('desc','')

        ft='ft'+str(k)
        h+=' <tr><td><b>'+ft+'</b> ('+desc+')</td><td><input type="text" name="m'+ft+'" value="'+str(features.get(ft,''))+'"></td></tr>\n'

    h+='</table>\n'

    # Buttons
    h+='<p><center>\n'
    h+='<button type="submit" name="action_refresh">Refresh form and find similar program</button>\n'
    h+='</center>\n'

    # Find similar
#    h+='<p><center>\n'
#    h+='<button type="submit" name="find_similar">Find programs with similar features</button>\n'
#    h+='<button type="submit" name="action_reset">Reset</button>\n'
#    h+='</center>\n'

    # If selected solution
    smuoa=''
    sduoa=''
    for k in i:
        if k.startswith('view_solution_'):
           kk=k[14:]
           j=kk.find('_')
           if j>0:
              smuoa=kk[:j]
              sduoa=kk[j+1:]

    if smuoa=='' and sduoa=='':
       scenario=i.get('scenario','')
       if scenario=='': scenario='8289e0cf24346aa7'
       i['scenario']=scenario

       ii={}
       if not ar: ii=copy.deepcopy(i)

       ii['action']='show'
       ii['module_uoa']='program.optimization'
       ii['widget']='yes'
       ii['prepared_url0']=url0
       ii['prepared_url1']=url1
       ii['prepared_form_name']=form_name
       ii['prepared_scenario_tags']='program-features'

       r=ck.access(ii)
       if r['return']>0: return r
        
       results=r.get('results',[])

       h+='<p><hr>'+r.get('html','')
       st+=r.get('style','')
    else:
       results=[{'module_uoa':smuoa, 'data_uoa':sduoa}]

    # Save a few vars to keep state
    popt=''
    if len(results)==1:
       # showing unique result *****************************************************
       rr=results[0]

       muoa=rr['module_uoa']
       duoa=rr['data_uoa']

       ii={'action':'html_viewer',
           'module_uoa':muoa,
           'data_uoa':duoa,
           'url_base':url0,
           'features':features}
       r=ck.access(ii)
       if r['return']>0: return r

       popt=r.get('predicted_opt','')

       h+='<p>'+r.get('html','')
       st+=r.get('style','')
    else:
       h+='<br><a href="http://arxiv.org/abs/1506.06256"><img src="'+url0+'action=pull&common_action=yes&cid='+cfg['module_deps']['module']+':'+cfg['module_deps']['program.optimization']+'&filename=images/image-workflow1.png"></a><br>\n'

    if sh=='yes':
       h=''
       st=''

    return {'return':0, 'html':h, 'style':st, 'predicted_opt':popt}

##############################################################################
# make safe strings for CMD ...

def safe_str(s):
    s=s.replace(';',' ').replace('&',' ').replace('>',' ').replace('<',' ')
    return s

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

##############################################################################
# access MILEPOST AI via unified CK JSON API

def ask_ai(i):
    """
    Input:  {
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """




    return {'return':0}

##############################################################################
# access XSB remotely on devices with constraint memory

def remote_xsb(i):
    """
    Input:  {
               (input) - XSB input file
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """

    # Setting output
    o=i.get('out','')

    er=i.get('exchange_repo','')
    if er=='': er=ck.cfg['default_exchange_repo_uoa']
    esr=i.get('exchange_subrepo','')
    if esr=='': esr=ck.cfg['default_exchange_subrepo_uoa']

    if i.get('local','')=='yes': 
       er='local'
       esr=''

    # Load featlstn.P
    r=ck.load_text_file({'text_file':file_features})
    if r['return']>0: return r
    fx=r['string']

    r=ck.access({'action':'remote_xsb_api',
                 'repo_uoa':er,
                 'remote_repo_uoa':esr,
                 'module_uoa':work['self_module_uid'],
                 'input':fx})
    if r['return']>0: return r

    # Save output
    ft=r['output']

    r=ck.save_text_file({'text_file':file_features_out, 'string':ft})
    if r['return']>0: return r

    return {'return':0}

##############################################################################
# XSB remote CK API

def remote_xsb_api(i):
    """
    Input:  {
              input - input source 
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0

               output - output features
            }

    """

    import os
    import tempfile
    import shutil
    import time

    fi=i['input']
    fo='features.FT'

    cur_dir=os.getcwd()

    # Go to tmp dir
    tdx=tempfile.gettempdir()

    rx=ck.gen_tmp_file({'prefix':'tmp-ck-xsb-'})
    if rx['return']>0: return rx
    ftmp=rx['file_name']

    td=os.path.join(tdx,ftmp)

    if not os.path.isdir(td):
       os.makedirs(td)

    os.chdir(td)

    # Save file
    r=ck.save_text_file({'text_file':file_features, 'string':fi})
    if r['return']>0: return r

    # Resolve deps on ctuning-cc-plugins
    r=ck.access({'action':'set',
                 'module_uoa':cfg['module_deps']['env'],
                 'tags':'plugin,milepost,ctuning'})
    if r['return']>0: return r

    bat=r['bat']
    prog=r['dict']['customize']['full_path']

    ss=bat+'\n'+prog

    os.system(ss)

    r=ck.load_text_file({'text_file':file_features_out, 'delete_after_read':'yes'})
    if r['return']>0: return r
    ft=r['string']

    if os.path.isdir(td): 
       shutil.rmtree(td)
       time.sleep(1)

    return {'return':0, 'output':ft}

##############################################################################
# CK AI JSON API for web (needed to automatically find such function from higher-level CK AI API)

def ask_ai_web(i):
    """
    Input:  {
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """

    return show(i)

##############################################################################
# return json instead of html in show (needed for CK AI API)

def show_json(i):
    """
    Input:  {
            }

    Output: {
              return       - return code =  0, if successful
                                         >  0, if error
              (error)      - error text if return > 0
            }

    """

    r=show(i)

    if 'html' in r: del(r['html'])
    if 'style' in r: del(r['style'])

    return r
