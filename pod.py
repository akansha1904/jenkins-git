import psutil
import sched, time
print ("hello pod")
s=sched.scheduler(time.time,time.sleep)
def do_something(sc):
   cpu=psutil.cpu_percent(interval=10)
   mem=psutil.virtual_memory()
   print(f'CPU:{cpu}')
   print(f'Memory:{mem}')
   s.enter(2,1,do_something,(sc,))
s.enter(2,1,do_something,(s,))
s.run()

