from django.http import HttpResponse
from django.shortcuts import redirect


def allowed_superuser(allowed_roles=[]):
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):
			if 'Superuser' in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				return redirect('/accessdenied')
		return wrapper_func
	return decorator

def allowed_executive(allowed_roles=[]):
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):
			if 'Executive' in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				return redirect('/accessdenied')
		return wrapper_func
	return decorator


def allowed_admin(allowed_roles=[]):
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):
			if 'Admin' in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				return redirect('/accessdenied')
		return wrapper_func
	return decorator


def allowed_bendahara(allowed_roles=[]):
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):
			if 'Bendahara' in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				return redirect('/accessdenied')
		return wrapper_func
	return decorator

def allowed_anggota(allowed_roles=[]):
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):
			if 'Anggota' in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				return redirect('/accessdenied')
		return wrapper_func
	return decorator


