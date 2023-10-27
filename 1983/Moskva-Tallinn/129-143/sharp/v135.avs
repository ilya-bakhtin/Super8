import("..\1983-Moskva-Tallinn.avs")

v135 = LSMASHVideoSource(dst_dir + "v135rc.mp4")

v135 = v135.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v135 = v135.convertToYV12(interlaced=false)

v135 = v135.deScratch
v135 = v135.removeDirt

v135 = v135.UnsharpMask(strength=500, radius=5, threshold=1)
v135 = v135.adjustBorders

va = BlankClip(v135, audio_rate = 48000, channels = 2).killVideo
v135 = v135.audioDub(va)

return v135.Prefetch

