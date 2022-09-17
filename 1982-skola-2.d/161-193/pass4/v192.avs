LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v192 = LSMASHVideoSource(dst_dir + "v192rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v192f.mp4")
v192 = ImageSource(file = dst_dir + "v192-png\v192-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v192 = v192.convertToY.adjustSize

#v192 = v192.extractY.convertToYV12(interlaced=false)
#v192 = v192.deScratch.extractY

v192 = v192.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v192 = v192.convertBits(8).convertToYV12(interlaced=false)

v192 = v192.deScratch.extractY
v192 = v192.removeDirt
v192 = v192.convertToYV12(interlaced=false)
v192 = v192.UnsharpMask(strength=400, radius=5, threshold=1)
v192 = v192.adjustBorders
#v192 = v192.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v192 = v192.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v192, audio_rate = 48000, channels = 2).killVideo
v192 = v192.audioDub(va)

return v192.Prefetch

